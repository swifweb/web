//
//  ForEach.swift
//  
//
//  Created by Mihael Isaev on 31.12.2022.
//

public class ForEach<Item>: BaseElement, ScrollHandleable, AlignAttrable where Item: Hashable {
    public override class var name: String { Div.name }
    
    public typealias Handler = (Int, Item) -> DOMContent
    public typealias HandlerValue = (Item) -> DOMContent
    public typealias HandlerSimple = () -> DOMContent
    
    let items: State<[Item]>
    let block: Handler
    
    required public init() {
        self.items = State(wrappedValue: [])
        self.block = { _,_ in
            DOM.none
        }
        super.init()
        _postInit()
    }
    
    public init (_ items: [Item], @DOM block: @escaping Handler) {
        self.items = State(wrappedValue: items)
        self.block = block
        super.init()
        _postInit()
    }
    
    public init (_ items: [Item], @DOM block: @escaping HandlerValue) {
        self.items = State(wrappedValue: items)
        self.block = { _, v in
            block(v)
        }
        super.init()
        _postInit()
    }
    
    public init (_ items: [Item], @DOM block: @escaping HandlerSimple) {
        self.items = State(wrappedValue: items)
        self.block = { _,_ in
            block()
        }
        super.init()
        _postInit()
    }
    
    public init (_ items: State<[Item]>, @DOM block: @escaping Handler) {
        self.items = items
        self.block = block
        super.init()
        _postInit()
    }
    
    public init (_ items: State<[Item]>, @DOM block: @escaping HandlerValue) {
        self.items = items
        self.block = { _, v in
            block(v)
        }
        super.init()
        _postInit()
    }
    
    public init (_ items: State<[Item]>, @DOM block: @escaping HandlerSimple) {
        self.items = items
        self.block = { _,_ in
            block()
        }
        super.init()
        _postInit()
    }
    
    func _postInit() {
        for item in allItems() {
            parseDOMItem(item.domContentItem)
        }
        subscribeToChanges({}, { [weak self] deletions, insertions, modifications in
            guard let self = self else { return }
            for element in self.properties.subElements.enumerated().compactMap({ deletions.contains($0.offset) ? $0.element : nil }) {
                element.remove()
            }
            insertions.forEach { insertion in
                func addAsDiv() {
                    let div = Div()
                    div.parseDOMItem(self.items(at: insertion).domContentItem)
                    self.insertChild(div, at: insertion)
                }
                func parse(_ item: DOMItem) {
                    switch item {
                    case .items(let items):
                        if items.count == 1, let item = items.first {
                            parse(item)
                        } else {
                            addAsDiv()
                        }
                    case .elements(let elements):
                        if elements.count == 1, let element = elements.first {
                            self.insertChild(element, at: insertion)
                        } else {
                            fallthrough
                        }
                    default:
                        addAsDiv()
                    }
                }
                parse(self.items(at: insertion).domContentItem)
            }
        }) {}
    }
    
    func parseDOMItem(_ item: DOMItem) {
        switch item {
        case .elements(let elements): elements.forEach { appendChild($0) }
        case .items(let items): items.forEach { parseDOMItem($0) }
        case .none: break
        }
    }
    
    private func allItems() -> [DOMContent] {
        items.wrappedValue.enumerated().compactMap { [weak self] in
            self?.block($0.offset, $0.element)
        }
    }
    
    func items(at index: Int) -> DOMContent {
        guard index < items.wrappedValue.count else { return DOM.none }
        return block(index, items.wrappedValue[index])
    }
    
    private func subscribeToChanges(_ begin: @escaping () -> Void, _ handler: @escaping ([Int], [Int], [Int]) -> Void, _ end: @escaping () -> Void) {
        items.beginTrigger(begin)
        items.listen { old, new in
            let diff = old.difference(new)
            let deletions = diff.removed.compactMap { $0.index }
            let insertions = diff.inserted.compactMap { $0.index }
            let modifications = diff.modified.compactMap { $0.index }
            guard deletions.count > 0 || insertions.count > 0 || modifications.count > 0 else { return }
            handler(deletions, insertions, modifications)
        }
        items.endTrigger(end)
    }
}

extension ForEach where Item == Int {
    public convenience init (_ items: ClosedRange<Item>, @DOM block: @escaping Handler) {
        self.init(items.map { $0 }, block: block)
    }
    
    public convenience init (_ items: ClosedRange<Item>, @DOM block: @escaping HandlerValue) {
        self.init(items.map { $0 }, block: block)
    }
    
    public convenience init (_ items: ClosedRange<Item>, @DOM block: @escaping HandlerSimple) {
        self.init(items.map { $0 }, block: block)
    }
}

extension Int {
    public func times(@DOM block: @escaping ForEach<Int>.Handler, file: StaticString = #fileID, line: UInt = #line) -> ForEach<Int> {
        assert(self >= 2, "Should be 2 times and more", file: file, line: line)
        return .init(0...(self - 1), block: block)
    }
    
    public func times(@DOM block: @escaping ForEach<Int>.HandlerValue, file: StaticString = #fileID, line: UInt = #line) -> ForEach<Int> {
        assert(self >= 2, "Should be 2 times and more", file: file, line: line)
        return .init(0...(self - 1), block: block)
    }
    
    public func times(@DOM block: @escaping ForEach<Int>.HandlerSimple, file: StaticString = #fileID, line: UInt = #line) -> ForEach<Int> {
        assert(self >= 2, "Should be 2 times and more", file: file, line: line)
        return .init(0...(self - 1), block: block)
    }
}

// TODO: move to separate file

public class BuilderFunction: DOMContent {
    public var domContentItem: DOMItem { .items([content.domContentItem]) }
    
    let content: DOMContent
    
    public init (_ valueToPass: String, @DOM content: @escaping (String) -> DOMContent) {
        self.content = content(valueToPass)
    }
    
    public init (_ valueToPass: Int8, @DOM content: @escaping (Int8) -> DOMContent) {
        self.content = content(valueToPass)
    }
    
    public init (_ valueToPass: Int16, @DOM content: @escaping (Int16) -> DOMContent) {
        self.content = content(valueToPass)
    }
    
    public init (_ valueToPass: Int32, @DOM content: @escaping (Int32) -> DOMContent) {
        self.content = content(valueToPass)
    }
    
    public init (_ valueToPass: Int64, @DOM content: @escaping (Int64) -> DOMContent) {
        self.content = content(valueToPass)
    }
    
    public init (_ valueToPass: Double, @DOM content: @escaping (Double) -> DOMContent) {
        self.content = content(valueToPass)
    }
    
    public init (_ valueToPass: Float, @DOM content: @escaping (Float) -> DOMContent) {
        self.content = content(valueToPass)
    }
    
    public init (_ valueToPass: UInt8, @DOM content: @escaping (UInt8) -> DOMContent) {
        self.content = content(valueToPass)
    }
    
    public init (_ valueToPass: UInt16, @DOM content: @escaping (UInt16) -> DOMContent) {
        self.content = content(valueToPass)
    }
    
    public init (_ valueToPass: UInt32, @DOM content: @escaping (UInt32) -> DOMContent) {
        self.content = content(valueToPass)
    }
    
    public init (_ valueToPass: UInt64, @DOM content: @escaping (UInt64) -> DOMContent) {
        self.content = content(valueToPass)
    }
    
    public init <Element>(_ valueToPass: Array<Element>, @DOM content: @escaping (Array<Element>) -> DOMContent) {
        self.content = content(valueToPass)
    }
    
    public init <Key, Value>(_ valueToPass: Dictionary<Key, Value>, @DOM content: @escaping (Dictionary<Key, Value>) -> DOMContent) {
        self.content = content(valueToPass)
    }
    
    public init <Result>(_ beforeRender: () -> Result, @DOM content: (Result) -> DOMContent) {
        self.content = content(beforeRender())
    }
}
