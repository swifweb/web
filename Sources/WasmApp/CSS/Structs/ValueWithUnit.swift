//
//  ValueWithUnit.swift
//  WasmApp
//
//  Created by Mihael Isaev on 08.07.2020.
//

public struct ValueWithUnit<V: Doubleable>: UnitValuable {
    public let value: V
    public let unit: Unit
    
    public init (_ value: V, _ unit: Unit) {
        self.value = value
        self.unit = unit
    }
}
