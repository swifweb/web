//
//  Container.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 24.02.2021.
//

import Foundation

class Container<Event: AnyEvent>: GenericContainer {
    typealias E = Event
    
    var isAddedToDOM: Bool = false
    var handlers: [(E) -> Void]
    
    lazy var closure: JSClosure = JSClosure { args -> JSValue in
        guard let event = args.first else { return .undefined }
        self.handlers.forEach { $0(.init(event)) }
        return .undefined
    }
    
    required init (_ handler: @escaping (Event) -> Void) {
        handlers = [handler]
    }
}

protocol AnyContainer: class {
    var isAddedToDOM: Bool { get set }
    var closure: JSClosure { get }
}

protocol GenericContainer: AnyContainer, AnyStorageValue {
    associatedtype E: AnyEvent
    
    var handlers: [(E) -> Void] { get set }
    init (_ handler: @escaping (E) -> Void)
}

extension GenericContainer {
    func shutdown() {
        handlers.removeAll()
        closure.release()
    }
}

extension Storageable {
    func createOrUpdate<GC>(_ type: GC.Type, _ handler: @escaping (GC.Value.E) -> Void) -> GC.Value
    where GC: StorageKey, GC.Value: GenericContainer {
        var container: GC.Value
        if let cached = storage[GC.self] {
            container = cached
            container.handlers.append(handler)
        } else {
            container = GC.Value(handler)
            storage[GC.self] = container
        }
        return container
    }
}
