//
//  WrapType.swift
//  WasmApp
//
//  Created by Mihael Isaev on 22.12.2020.
//

import Foundation

public final class WrapType {
    public let value: String
    
    public init (_ value: String) {
        self.value = value
    }
    
    /// The browser automatically inserts line breaks (CR+LF)
    /// so that each line has no more than the width of the control;
    /// the cols attribute must also be specified for this to take effect.
    public static var hard: WrapType { .init("hard") }
    
    /// The browser ensures that all line breaks in the value
    /// consist of a CR+LF pair, but does not insert any additional line breaks.
    public static var soft: WrapType { .init("soft") }
    
    /// Like soft but changes appearance to white-space:
    ///     pre so line segments exceeding cols are not wrapped and the <textarea> becomes horizontally scrollable.
    public static var off: WrapType { .init("off") }
}

