//
//  BorderRadiusType.swift
//  WasmApp
//
//  Created by Mihael Isaev on 10.07.2020.
//

public final class BorderRadiusType: Initialable, Inheritable, Lengthable, Percentable, CustomStringConvertible, _PropertyValueInnerChangeable {
    @State public var value: String
    
    var _changeHandler = {}
    
    required public init (_ value: String) { self.value = value }
    
    public var description: String { value }
}
