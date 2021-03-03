//
//  AbstractWorker.swift
//  WorkersAPI
//
//  Created by Mihael Isaev on 27.02.2021.
//

import WebFoundation

/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/AbstractWorker)
public protocol AbstractWorker: Storageable {
    var jsValue: JSValue { get set }
    
    /// It is invoked whenever an `ErrorEvent` of type error bubbles through the worker.
    @discardableResult
    func onError(_ handler: @escaping () -> Void) -> Self
}

extension AbstractWorker {
    /// It is invoked whenever an `ErrorEvent` of type error bubbles through the worker.
    @discardableResult
    public func onError(_ handler: @escaping () -> Void) -> Self {
        storage[AbstractWorkerErrorHandler.self]?.shutdown()
        let container = AbstractWorkerErrorHandler(handler)
        storage[AbstractWorkerErrorHandler.self] = container
        jsValue.onerror = container.closure.jsValue()
        return self
    }
}

class AbstractWorkerErrorHandler: AnyStorageValue, StorageKey {
    typealias Value = AbstractWorkerErrorHandler
    
    var handler: (() -> Void)?
    
    lazy var closure: JSClosure = JSClosure { _ -> JSValue in
        self.handler?()
        return .undefined
    }
    
    init (_ handler: @escaping () -> Void) {
        self.handler = handler
    }
    
    func shutdown() {
        closure.release()
        handler = nil
    }
}
