//
//  Title.swift
//  WasmApp
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation

open class Title: BaseElement {
    var value: String {
        get { innerText }
        set { innerText = newValue }
    }
}
