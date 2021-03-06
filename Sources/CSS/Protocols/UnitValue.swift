//
//  UnitValue.swift
//  CSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

import WebFoundation

public protocol AnyUnitValuable: CustomStringConvertible {}

public protocol UnitValuable: AnyUnitValuable {
    associatedtype V: Doubleable
    
    var value: V { get }
    var unit: Unit { get }
}

public class UnitValue: UnitValuable, UniValue, _PropertyValueInnerChangeable {
    @State public var value: Double = 0
    @State public var unit: Unit = .px
    
    public typealias UniValue = UnitValue
    public var uniValue: UnitValue { self }
    public var uniStateValue: State<UnitValue>? { nil }
    
    var _changeHandler = {}
    
    public init (_ value: Double, _ unit: Unit) {
        self.value = value
        self.unit = unit
        $value.listen {
            self._changeHandler()
        }
        $unit.listen {
            self._changeHandler()
        }
    }
    
    convenience init (_ value: State<Double>, _ unit: Unit) {
        self.init(value.wrappedValue, unit)
        value.listen {
            self.value = $0
        }
    }
    
    convenience init (_ value: Double, _ unit: State<Unit>) {
        self.init(value, unit.wrappedValue)
        unit.listen {
            self.unit = $0
        }
    }
    
    convenience init (_ value: State<Double>, _ unit: State<Unit>) {
        self.init(value.wrappedValue, unit.wrappedValue)
        value.listen {
            self.value = $0
        }
        unit.listen {
            self.unit = $0
        }
    }
    
    convenience init <V>(_ value: ExpressableState<V, Double>, _ unit: Unit) {
        self.init(value.unwrap(), unit)
    }
    
    convenience init <V>(_ value: ExpressableState<V, Double>, _ unit: State<Unit>) {
        self.init(value.unwrap(), unit)
    }
    
    convenience init <V>(_ value: Double, _ unit: ExpressableState<V, Unit>) {
        self.init(value, unit.unwrap())
    }
    
    convenience init <V>(_ value: State<Double>, _ unit: ExpressableState<V, Unit>) {
        self.init(value, unit.unwrap())
    }
    
    convenience init <V, U>(_ value: ExpressableState<V, Double>, _ unit: ExpressableState<U, Unit>) {
        self.init(value.unwrap(), unit.unwrap())
    }
}

extension UnitValuable {
    public var description: String { "\(value)\(unit.rawValue)" }
    
    public var cm: ValueWithUnit<V> { .init(value, .cm) }
    public var mm: ValueWithUnit<V> { .init(value, .mm) }
    public var `in`: ValueWithUnit<V> { .init(value, .in) }
    public var px: ValueWithUnit<V> { .init(value, .px) }
    public var pt: ValueWithUnit<V> { .init(value, .pt) }
    public var pc: ValueWithUnit<V> { .init(value, .pc) }
    public var fr: ValueWithUnit<V> { .init(value, .fr) }
    public var em: ValueWithUnit<V> { .init(value, .em) }
    public var ex: ValueWithUnit<V> { .init(value, .ex) }
    public var ch: ValueWithUnit<V> { .init(value, .ch) }
    public var rem: ValueWithUnit<V> { .init(value, .rem) }
    public var vw: ValueWithUnit<V> { .init(value, .vw) }
    public var vh: ValueWithUnit<V> { .init(value, .vh) }
    public var vmin: ValueWithUnit<V> { .init(value, .vmin) }
    public var vmax: ValueWithUnit<V> { .init(value, .vmax) }
    public var percent: ValueWithUnit<V> { .init(value, .percent) }
    
    public func unit(_ u: Unit) -> ValueWithUnit<V> { .init(value, u) }
}

extension UInt: UnitValuable {
    public var value: Self { self }
    public var unit: Unit { .px }
}

extension UInt8: UnitValuable {
    public var value: Self { self }
    public var unit: Unit { .px }
}

extension UInt16: UnitValuable {
    public var value: Self { self }
    public var unit: Unit { .px }
}

extension UInt32: UnitValuable {
    public var value: Self { self }
    public var unit: Unit { .px }
}

extension UInt64: UnitValuable {
    public var value: Self { self }
    public var unit: Unit { .px }
}

extension Int: UnitValuable {
    public var value: Self { self }
    public var unit: Unit { .px }
}

extension Int8: UnitValuable {
    public var value: Self { self }
    public var unit: Unit { .px }
}

extension Int16: UnitValuable {
    public var value: Self { self }
    public var unit: Unit { .px }
}

extension Int32: UnitValuable {
    public var value: Self { self }
    public var unit: Unit { .px }
}

extension Int64: UnitValuable {
    public var value: Self { self }
    public var unit: Unit { .px }
}

extension Double: UnitValuable {
    public var value: Double { self }
    public var unit: Unit { .px }
}

extension Float32: UnitValuable {
    public var value: Self { self }
    public var unit: Unit { .px }
}
