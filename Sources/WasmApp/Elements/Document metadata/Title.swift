//
//  Title.swift
//  WasmApp
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation

///
///
/// [Learn more ->](<#T##c: Character##Character#>)
open class Title: BaseContentElement {
    var value: String {
        get { innerText }
        set { innerText = newValue }
    }
}
