//
//  Text.swift
//  WasmApp
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation

open class Text: BaseElement {
    public override class var name: String { "div" }
    
    public convenience init (_ text: String) {
        self.init()
        value = text
    }
    
    var value: String {
        get { innerText }
        set { innerText = newValue }
    }
}
