//
//  Button.swift
//  WasmApp
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

open class Button: BaseElement {
    var value: String {
        get { innerText }
        set { innerText = newValue }
    }
    
    var clickClosure: JSClosure?
    var clickHandler = {}
    
    deinit {
        clickClosure?.release()
    }
    
    public convenience init (_ title: String) {
        self.init()
        value = title
    }
    
    @discardableResult
    public func onClick(_ handler: @escaping () -> Void) -> Self {
        clickClosure?.release()
        clickClosure = JSClosure { _ -> Void in
            self.clickHandler()
        }
        domElement.onclick = clickClosure.jsValue()
        clickHandler = handler
        return self
    }
}
