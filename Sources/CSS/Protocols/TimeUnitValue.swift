//
//  TimeValue.swift
//  CSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

import WebFoundation

public protocol TimeUnitValue: CustomStringConvertible {
    associatedtype V: Doubleable
    
    var value: V { get }
    var timeUnit: TimeUnit { get }
}

public class TimeUnitValueContainer: TimeUnitValue, CustomStringConvertible, _PropertyValueInnerChangeable {
    @State public var value: Double = 0
    @State public var timeUnit: TimeUnit = .ms
    
    var _changeHandler = {}
    
    init (_ value: Double, _ timeUnit: TimeUnit) {
        self.value = value
        self.timeUnit = timeUnit
        $value.listen {
            self._changeHandler()
        }
        $timeUnit.listen {
            self._changeHandler()
        }
    }
    
    convenience init (_ value: State<Double>, _ timeUnit: TimeUnit) {
        self.init(value.wrappedValue, timeUnit)
        value.listen {
            self.value = $0
        }
    }
    
    convenience init (_ value: Double, _ timeUnit: State<TimeUnit>) {
        self.init(value, timeUnit.wrappedValue)
        timeUnit.listen {
            self.timeUnit = $0
        }
    }
    
    convenience init (_ value: State<Double>, _ timeUnit: State<TimeUnit>) {
        self.init(value.wrappedValue, timeUnit.wrappedValue)
        value.listen {
            self.value = $0
        }
        timeUnit.listen {
            self.timeUnit = $0
        }
    }
    
    convenience init <V>(_ value: ExpressableState<V, Double>, _ timeUnit: TimeUnit) {
        self.init(value.unwrap(), timeUnit)
    }
    
    convenience init <V>(_ value: ExpressableState<V, Double>, _ timeUnit: State<TimeUnit>) {
        self.init(value.unwrap(), timeUnit)
    }
    
    convenience init <V>(_ value: Double, _ timeUnit: ExpressableState<V, TimeUnit>) {
        self.init(value, timeUnit.unwrap())
    }
    
    convenience init <V>(_ value: State<Double>, _ timeUnit: ExpressableState<V, TimeUnit>) {
        self.init(value, timeUnit.unwrap())
    }
    
    convenience init <V, U>(_ value: ExpressableState<V, Double>, _ timeUnit: ExpressableState<U, TimeUnit>) {
        self.init(value.unwrap(), timeUnit.unwrap())
    }
    
    public var description: String { "\(value)\(timeUnit.rawValue)" }
}

extension TimeUnitValue {
    public var description: String { "\(value)\(timeUnit.rawValue)" }
    
    public var ms: ValueWithTimeUnit<V> { .init(value, .ms) }
    public var s: ValueWithTimeUnit<V> { .init(value, .s) }
    
    public func unit(_ u: TimeUnit) -> ValueWithTimeUnit<V> { .init(value, u) }
}

extension UInt: TimeUnitValue {
    public var timeUnit: TimeUnit { .default }
}

extension UInt8: TimeUnitValue {
    public var timeUnit: TimeUnit { .default }
}

extension UInt16: TimeUnitValue {
    public var timeUnit: TimeUnit { .default }
}

extension UInt32: TimeUnitValue {
    public var timeUnit: TimeUnit { .default }
}

extension UInt64: TimeUnitValue {
    public var timeUnit: TimeUnit { .default }
}

extension Int: TimeUnitValue {
    public var timeUnit: TimeUnit { .default }
}

extension Int8: TimeUnitValue {
    public var timeUnit: TimeUnit { .default }
}

extension Int16: TimeUnitValue {
    public var timeUnit: TimeUnit { .default }
}

extension Int32: TimeUnitValue {
    public var timeUnit: TimeUnit { .default }
}

extension Int64: TimeUnitValue {
    public var timeUnit: TimeUnit { .default }
}

extension Double: TimeUnitValue {
    public var timeUnit: TimeUnit { .default }
}

extension Float32: TimeUnitValue {
    public var timeUnit: TimeUnit { .default }
}

public protocol Doubleable {
    var doubleValue: Double { get }
}

extension UInt: Doubleable {
    public var doubleValue: Double { Double(self) }
}

extension UInt8: Doubleable {
    public var doubleValue: Double { Double(self) }
}

extension UInt16: Doubleable {
    public var doubleValue: Double { Double(self) }
}

extension UInt32: Doubleable {
    public var doubleValue: Double { Double(self) }
}

extension UInt64: Doubleable {
    public var doubleValue: Double { Double(self) }
}

extension Int: Doubleable {
    public var doubleValue: Double { Double(self) }
}

extension Int8: Doubleable {
    public var doubleValue: Double { Double(self) }
}

extension Int16: Doubleable {
    public var doubleValue: Double { Double(self) }
}

extension Int32: Doubleable {
    public var doubleValue: Double { Double(self) }
}

extension Int64: Doubleable {
    public var doubleValue: Double { Double(self) }
}

extension Double: Doubleable {
    public var doubleValue: Double { self }
}

extension Float32: Doubleable {
    public var doubleValue: Double { Double(self) }
}
