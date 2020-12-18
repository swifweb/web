//
//  Button.swift
//  WasmApp
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation

open class Button: BaseActiveElement {
    var value: String {
        get { innerText }
        set { innerText = newValue }
    }
    
    public convenience init (_ title: String) {
        self.init()
        value = title
    }
}
