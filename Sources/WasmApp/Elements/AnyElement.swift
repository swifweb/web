//
//  AnyElement.swift
//  WasmApp
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

public protocol AnyElement: class {
    static var name: String { get }
}

protocol _AnyElement: AnyElement {
    var domElement: JSValue { get set }
}

extension _AnyElement {
    func appendChild(_ element: _AnyElement) {
        _ = domElement.appendChild(element.domElement)
    }
}
