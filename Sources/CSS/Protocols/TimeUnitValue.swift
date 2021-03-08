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

public class TimeUnitValueContainer: TimeUnitValue, UniValue, CustomStringConvertible, _PropertyValueInnerChangeable {
    @State public var value: Double = 0
    @State public var timeUnit: TimeUnit = .ms
    
    public var uniValue: TimeUnitValueContainer { self }
    public lazy var uniStateValue: State<TimeUnitValueContainer>? = .init(wrappedValue: self)
    
    var _changeHandler = {}
    
    init <D, T>(_ value: D, _ timeUnit: T) where D: UniValue, D.UniValue == Double, T: UniValue, T.UniValue == TimeUnit {
        self.value = value.uniValue
        self.timeUnit = timeUnit.uniValue
        if let state = value.uniStateValue {
            $value.merge(with: state, leftChanged: { _ in
                self._changeHandler()
                self.uniStateValue?.manualChangeNotify()
            }, rightChanged: { _ in
                self._changeHandler()
                self.uniStateValue?.manualChangeNotify()
            })
        } else {
            $value.listen {
                self._changeHandler()
                self.uniStateValue?.manualChangeNotify()
            }
        }
        if let state = timeUnit.uniStateValue {
            $timeUnit.merge(with: state, leftChanged: { _ in
                self._changeHandler()
                self.uniStateValue?.manualChangeNotify()
            }, rightChanged: { _ in
                self._changeHandler()
                self.uniStateValue?.manualChangeNotify()
            })
        } else {
            $timeUnit.listen {
                self._changeHandler()
                self.uniStateValue?.manualChangeNotify()
            }
        }
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
