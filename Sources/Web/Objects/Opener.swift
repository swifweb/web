//
//  Opener.swift
//  
//
//  Created by Mihael Isaev on 16.11.2020.
//

import Foundation
import JavaScriptKit

public struct Opener {
    /// Name of the element inside DOM
    let domElementName = "opener"
    
    /// Reference to DOM-object
    let domElement: JSValue
    
    init? (_ root: JSValue) {
        domElement = root[dynamicMember: domElementName]
        return nil
    }
}
