//
//  ForEach.swift
//
//
//  Created by Mihael Isaev on 31.12.2022.
//

import WebFoundation

public protocol AnyForEach {
    var count: Int { get }
    @MainActor func allItems() -> [RulesContent]
    @MainActor func items(at index: Int) -> RulesContent
    func subscribeToChanges(_ begin: @escaping () -> Void, _ handler: @escaping ([Int], [Int], [Int]) -> Void, _ end: @escaping () -> Void)
}

public class ForEach<Item> where Item: Hashable {
    public typealias Handler = @MainActor (Int, Item) -> RulesContent
    public typealias HandlerValue = @MainActor (Item) -> RulesContent
    public typealias HandlerSimple = @MainActor () -> RulesContent
    
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
    
    @MainActor public func allItems() -> [RulesContent] {
        items.wrappedValue.enumerated().compactMap { [weak self] in
            self?.block($0.offset, $0.element)
        }
    }
    
    @MainActor public func items(at index: Int) -> RulesContent {
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
    @MainActor public var rulesContent: Rules.Item {
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
    @MainActor public var rulesContent: Rules.Item { .items([content.rulesContent]) }

    let content: RulesContent

    @MainActor public init(_ value: String, @Rules content: @escaping @MainActor (String) -> RulesContent) {
        self.content = content(value)
    }
    @MainActor public init(_ value: Int8, @Rules content: @escaping @MainActor (Int8) -> RulesContent) {
        self.content = content(value)
    }
    @MainActor public init(_ value: Int16, @Rules content: @escaping @MainActor (Int16) -> RulesContent) {
        self.content = content(value)
    }
    @MainActor public init(_ value: Int32, @Rules content: @escaping @MainActor (Int32) -> RulesContent) {
        self.content = content(value)
    }
    @MainActor public init(_ value: Int64, @Rules content: @escaping @MainActor (Int64) -> RulesContent) {
        self.content = content(value)
    }
    @MainActor public init(_ value: Int, @Rules content: @escaping @MainActor (Int) -> RulesContent) {
        self.content = content(value)
    }
    @MainActor public init(_ value: Double, @Rules content: @escaping @MainActor (Double) -> RulesContent) {
        self.content = content(value)
    }
    @MainActor public init(_ value: Float, @Rules content: @escaping @MainActor (Float) -> RulesContent) {
        self.content = content(value)
    }
    @MainActor public init(_ value: UInt8, @Rules content: @escaping @MainActor (UInt8) -> RulesContent) {
        self.content = content(value)
    }
    @MainActor public init(_ value: UInt16, @Rules content: @escaping @MainActor (UInt16) -> RulesContent) {
        self.content = content(value)
    }
    @MainActor public init(_ value: UInt32, @Rules content: @escaping @MainActor (UInt32) -> RulesContent) {
        self.content = content(value)
    }
    @MainActor public init(_ value: UInt64, @Rules content: @escaping @MainActor (UInt64) -> RulesContent) {
        self.content = content(value)
    }
    @MainActor public init<Element>(_ value: [Element], @Rules content: @escaping @MainActor ([Element]) -> RulesContent) {
        self.content = content(value)
    }
    @MainActor public init<Key, Value>(_ value: [Key: Value], @Rules content: @escaping @MainActor ([Key: Value]) -> RulesContent) {
        self.content = content(value)
    }
    @MainActor public init<Result>(_ beforeRender: @escaping @MainActor () -> Result, @Rules content: @escaping @MainActor (Result) -> RulesContent) {
        self.content = content(beforeRender())
    }
}
