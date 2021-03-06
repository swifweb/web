//
//  ValueWithTime.swift
//  CSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

import WebFoundation

public struct ValueWithTimeUnit<V: Doubleable>: TimeUnitValue, UniValue {
    public let value: V
    public let timeUnit: TimeUnit
    
    public init (_ value: V, _ timeUnit: TimeUnit) {
        self.value = value
        self.timeUnit = timeUnit
    }
    
    public typealias UniValue = TimeUnitValueContainer
    public var uniValue: TimeUnitValueContainer { TimeUnitValueContainer(value.doubleValue, timeUnit) }
    public var uniStateValue: State<TimeUnitValueContainer>? { nil }
}
