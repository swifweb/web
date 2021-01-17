//
//  StringInitializable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 23.12.2020.
//

import Foundation
import JavaScriptKit

public protocol StringInitializable: class {
    init (_ value: String)
    init (_ value: State<String>)
    init <V>(_ value: ExpressableState<V, String>)
}

protocol _StringInitializable: _BaseContentElementable, StringInitializable {
    var value: String { get set }
}

extension _StringInitializable {
    var value: String {
        get { innerText }
        set { innerText = newValue }
    }
}

extension StringInitializable {
    public init (_ value: State<String>) {
        self.init(value.wrappedValue)
        value.listen {
            guard let s = self as? _StringInitializable else { return }
            s.value = $0
        }
    }
    
    public init <V>(_ value: ExpressableState<V, String>) {
        self.init(value.unwrap())
    }
}
