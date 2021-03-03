//
//  JSValuable.swift
//  WebFoundation
//
//  Created by Mihael Isaev on 28.02.2021.
//

import JavaScriptKit

public protocol JSValuable {
    var jsValue: JSValue { get }
}
