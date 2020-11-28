//
//  AnyElement.swift
//  WasmApp
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

protocol AnyElement: class {
    static var name: String { get }
    var domElement: JSValue { get }
}

extension AnyElement {
    func appendChild(_ element: AnyElement) {
        _ = domElement.appendChild(element.domElement)
    }
}
