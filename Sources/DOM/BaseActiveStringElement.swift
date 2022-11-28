//
//  BaseActiveStringElement.swift
//  DOM
//
//  Created by Mihael Isaev on 02.07.2021.
//

import Foundation
import JavaScriptKit

open class BaseActiveStringElement: BaseActiveElement, _StringInitializable {
    var value: String {
        get { innerText }
        set { innerText = newValue }
    }

    /// String initializer
    /// - Parameter title: Pass `String` or `State<String>`
    required public convenience init <U>(_ title: U) where U: UniValue, U.UniValue == String {
        self.init()
        value = title.uniValue
        title.uniStateValue?.listen { [weak self] in
            self?.value = $0
        }
    }
    
    required public init() {
        super.init()
    }
}
