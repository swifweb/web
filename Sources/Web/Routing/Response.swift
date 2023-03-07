//
//  Response.swift
//
//
//  Created by Mihael Isaev on 22.11.2020.
//

import Foundation
import JavaScriptKit

public protocol Response: AnyObject {
    var controller: PageController { get }
}
