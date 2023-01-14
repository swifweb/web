//
//  ForEach.swift
//
//
//  Created by Mihael Isaev on 31.12.2022.
//

import WebFoundation

public protocol AnyForEach {
    var count: Int { get }
    func allItems() -> [RulesContent]
    func items(at index: Int) -> RulesContent
    func subscribeToChanges(_ begin: @escaping () -> Void, _ handler: @escaping ([Int], [Int], [Int]) -> Void, _ end: @escaping () -> Void)
}

public class ForEach<Item> where Item: Hashable {
    public typealias Handler = (Int, Item) -> RulesContent
    public typealias HandlerValue = (Item) -> RulesContent
    public typealias HandlerSimple = () -> RulesContent
    
    let items: State<[Item]>
    let block: Handler
    
    public init (_ items: [Item], @Rules block: @escaping Handler) {
        self.items = State(wrappedValue: items)
        self.block = block
    }
    
    public init (_ items: [Item], @Rules block: @escaping HandlerValue) {
        self.items = State(wrappedValue: items)
        self.block = { _, v in
            block(v)
        }
    }
    
    public init (_ items: [Item], @Rules block: @escaping HandlerSimple) {
        self.items = State(wrappedValue: items)
        self.block = { _,_ in
            block()
        }
    }
    
    public init (_ items: State<[Item]>, @Rules block: @escaping Handler) {
        self.items = items
        self.block = block
    }
    
    public init (_ items: State<[Item]>, @Rules block: @escaping HandlerValue) {
        self.items = items
        self.block = { _, v in
            block(v)
        }
    }
    
    public init (_ items: State<[Item]>, @Rules block: @escaping HandlerSimple) {
        self.items = items
        self.block = { _,_ in
            block()
        }
    }
}

extension ForEach: AnyForEach {
    public var count: Int { items.wrappedValue.count }
    
    public func allItems() -> [RulesContent] {
        items.wrappedValue.enumerated().compactMap { [weak self] in
            self?.block($0.offset, $0.element)
        }
    }
    
    public func items(at index: Int) -> RulesContent {
        guard index < items.wrappedValue.count else { return Rules.none }
        return block(index, items.wrappedValue[index])
    }
    
    public func subscribeToChanges(_ begin: @escaping () -> Void, _ handler: @escaping ([Int], [Int], [Int]) -> Void, _ end: @escaping () -> Void) {
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

extension ForEach: RulesContent {
    public var rulesContent: Rules.Item {
        .forEach(self)
    }
}

extension ForEach where Item == Int {
    public convenience init (_ items: ClosedRange<Item>, @Rules block: @escaping Handler) {
        self.init(items.map { $0 }, block: block)
    }
    
    public convenience init (_ items: ClosedRange<Item>, @Rules block: @escaping HandlerValue) {
        self.init(items.map { $0 }, block: block)
    }
    
    public convenience init (_ items: ClosedRange<Item>, @Rules block: @escaping HandlerSimple) {
        self.init(items.map { $0 }, block: block)
    }
}

extension Int {
    public func times(@Rules block: @escaping ForEach<Int>.Handler, file: StaticString = #fileID, line: UInt = #line) -> ForEach<Int> {
        assert(self >= 2, "Should be 2 times and more", file: file, line: line)
        return .init(0...(self - 1), block: block)
    }
    
    public func times(@Rules block: @escaping ForEach<Int>.HandlerValue, file: StaticString = #fileID, line: UInt = #line) -> ForEach<Int> {
        assert(self >= 2, "Should be 2 times and more", file: file, line: line)
        return .init(0...(self - 1), block: block)
    }
    
    public func times(@Rules block: @escaping ForEach<Int>.HandlerSimple, file: StaticString = #fileID, line: UInt = #line) -> ForEach<Int> {
        assert(self >= 2, "Should be 2 times and more", file: file, line: line)
        return .init(0...(self - 1), block: block)
    }
}

// TODO: move to separate file

public class BuilderFunction: RulesContent {
    public var rulesContent: Rules.Item { .items([content.rulesContent]) }
    
    let content: RulesContent
    
    public init <Result>(_ valueToPass: Result, @Rules content: @escaping (Result) -> RulesContent) where Result == String {
        self.content = content(valueToPass)
    }
    
    public init <Result>(_ valueToPass: Result, @Rules content: @escaping (Result) -> RulesContent) where Result == Int8 {
        self.content = content(valueToPass)
    }
    
    public init <Result>(_ valueToPass: Result, @Rules content: @escaping (Result) -> RulesContent) where Result == Int16 {
        self.content = content(valueToPass)
    }
    
    public init <Result>(_ valueToPass: Result, @Rules content: @escaping (Result) -> RulesContent) where Result == Int32 {
        self.content = content(valueToPass)
    }
    
    public init <Result>(_ valueToPass: Result, @Rules content: @escaping (Result) -> RulesContent) where Result == Int64 {
        self.content = content(valueToPass)
    }
    
    public init <Result>(_ valueToPass: Result, @Rules content: @escaping (Result) -> RulesContent) where Result == Int {
        self.content = content(valueToPass)
    }
    
    public init <Result>(_ valueToPass: Result, @Rules content: @escaping (Result) -> RulesContent) where Result == Double {
        self.content = content(valueToPass)
    }
    
    public init <Result>(_ valueToPass: Result, @Rules content: @escaping (Result) -> RulesContent) where Result == Float {
        self.content = content(valueToPass)
    }
    
    public init <Result>(_ valueToPass: Result, @Rules content: @escaping (Result) -> RulesContent) where Result == UInt8 {
        self.content = content(valueToPass)
    }
    
    public init <Result>(_ valueToPass: Result, @Rules content: @escaping (Result) -> RulesContent) where Result == UInt16 {
        self.content = content(valueToPass)
    }
    
    public init <Result>(_ valueToPass: Result, @Rules content: @escaping (Result) -> RulesContent) where Result == UInt32 {
        self.content = content(valueToPass)
    }
    
    public init <Result>(_ valueToPass: Result, @Rules content: @escaping (Result) -> RulesContent) where Result == UInt64 {
        self.content = content(valueToPass)
    }
    
    public init <Result, Element>(_ valueToPass: Result, @Rules content: @escaping (Result) -> RulesContent) where Result == Array<Element> {
        self.content = content(valueToPass)
    }
    
    public init <Result, Key, Value>(_ valueToPass: Result, @Rules content: @escaping (Result) -> RulesContent) where Result == Dictionary<Key, Value> {
        self.content = content(valueToPass)
    }
    
    public init <Result>(_ beforeRender: @escaping () -> Result, @Rules content: @escaping (Result) -> RulesContent) {
        self.content = content(beforeRender())
    }
}
