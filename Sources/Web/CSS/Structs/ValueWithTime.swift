//
//  ValueWithTime.swift
//  Web
//
//  Created by Mihael Isaev on 08.07.2020.
//

public struct ValueWithTimeUnit<V: Doubleable>: TimeUnitValue {
    public let value: V
    public let timeUnit: TimeUnit
    
    public init (_ value: V, _ timeUnit: TimeUnit) {
        self.value = value
        self.timeUnit = timeUnit
    }
}
