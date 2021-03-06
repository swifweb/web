//
//  ValueWithUnit.swift
//  CSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

import WebFoundation

public struct ValueWithUnit<V: Doubleable>: UnitValuable, UniValue {
    public let value: V
    public let unit: Unit
    
    public init (_ value: V, _ unit: Unit) {
        self.value = value
        self.unit = unit
    }
    
    public typealias UniValue = UnitValue
    public var uniValue: UnitValue { UnitValue(value.doubleValue, unit) }
    public var uniStateValue: State<UnitValue>? { nil }
}
