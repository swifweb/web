//
//  ValueWithUnit.swift
//  CSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

import WebFoundation

public struct ValueWithUnit<V: Doubleable>: UnitValuable, UniValue, PropertyValueImportantable {
    public let value: V
    public let unit: Unit
    
    public init (_ value: V, _ unit: Unit) {
        self.value = value
        self.unit = unit
    }
    
    public var important: Self { .init(value, unit.important) }
    
    public typealias UniValue = UnitValue
    public var uniValue: UnitValue { UnitValue(value.doubleValue, unit) }
    public var uniStateValue: State<UnitValue>? { nil }
}
