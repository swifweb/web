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

public class UnitValue: UnitValuable, UniValue, _PropertyValueInnerChangeable, CustomStringConvertible {
    @State public var value: Double = 0
    @State public var unit: Unit = .px
    
    public var description: String { "\(value)\(unit.rawValue)" }
    
    public var uniValue: UnitValue { self }
    public lazy var uniStateValue: State<UnitValue>? = .init(wrappedValue: self)
    
    var _changeHandler = {}
    
    public init <D, U>(_ value: D, _ unit: U) where D: UniValue, D.UniValue == Double, U: UniValue, U.UniValue == Unit {
        self.value = value.uniValue
        self.unit = unit.uniValue
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
        if let state = unit.uniStateValue {
            $unit.merge(with: state, leftChanged: { _ in
                self._changeHandler()
                self.uniStateValue?.manualChangeNotify()
            }, rightChanged: { _ in
                self._changeHandler()
                self.uniStateValue?.manualChangeNotify()
            })
        } else {
            $unit.listen {
                self._changeHandler()
                self.uniStateValue?.manualChangeNotify()
            }
        }
    }
    
    public init <D>(_ value: D, _ unit: Unit) where D: UniValue, D.UniValue == Double {
        self.value = value.uniValue
        self.unit = unit
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
    }
}

extension State where Value == Double {
    public var cm: State<UnitValue> { self.map { UnitValue($0, .cm) } }
    public var mm: State<UnitValue> { self.map { UnitValue($0, .mm) } }
    public var `in`: State<UnitValue> { self.map { UnitValue($0, .in) } }
    public var px: State<UnitValue> { self.map { UnitValue($0, .px) } }
    public var pt: State<UnitValue> { self.map { UnitValue($0, .pt) } }
    public var pc: State<UnitValue> { self.map { UnitValue($0, .pc) } }
    public var fr: State<UnitValue> { self.map { UnitValue($0, .fr) } }
    public var em: State<UnitValue> { self.map { UnitValue($0, .em) } }
    public var ex: State<UnitValue> { self.map { UnitValue($0, .ex) } }
    public var ch: State<UnitValue> { self.map { UnitValue($0, .ch) } }
    public var rem: State<UnitValue> { self.map { UnitValue($0, .rem) } }
    public var vw: State<UnitValue> { self.map { UnitValue($0, .vw) } }
    public var vh: State<UnitValue> { self.map { UnitValue($0, .vh) } }
    public var vmin: State<UnitValue> { self.map { UnitValue($0, .vmin) } }
    public var vmax: State<UnitValue> { self.map { UnitValue($0, .vmax) } }
    public var percent: State<UnitValue> { self.map { UnitValue($0, .percent) } }
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
