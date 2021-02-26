//
//  Opener.swift
//  DOM
//
//  Created by Mihael Isaev on 16.11.2020.
//

import WebFoundation

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
