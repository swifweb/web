//
//  Response.swift
//
//
//  Created by Mihael Isaev on 22.11.2020.
//

import Foundation
import JavaScriptKit

public protocol Response: class {
    var controller: ViewController { get }
}
