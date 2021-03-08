//
//  StringInitializable.swift
//  DOM
//
//  Created by Mihael Isaev on 23.12.2020.
//

import WebFoundation

public protocol StringInitializable: class {
    init <U>(_ value: U) where U: UniValue, U.UniValue == String
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
