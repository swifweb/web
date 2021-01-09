//
//  NumericValue.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

public protocol NumericValue: CustomStringConvertible {
    var numericValue: String { get }
}

extension NumericValue {
    public var description: String { numericValue }
}

public class NumericValueContainer: CustomStringConvertible, _PropertyValueInnerChangeable {
    public var value: String
    
    var _changeHandler = {}
    
    public init (_ value: NumericValue) {
        self.value = value.numericValue
    }
    
    public convenience init <N>(_ value: N) where N: StateConvertible, N.Value: NumericValue {
        let value = value.stateValue
        self.init(value.wrappedValue)
        value.listen {
            self.value = $0.numericValue
            self._changeHandler()
        }
    }
    
    public var description: String { value }
}

extension UInt: NumericValue {
    public var numericValue: String { "\(self)" }
}

extension UInt8: NumericValue {
    public var numericValue: String { "\(self)" }
}

extension UInt16: NumericValue {
    public var numericValue: String { "\(self)" }
}

extension UInt32: NumericValue {
    public var numericValue: String { "\(self)" }
}

extension UInt64: NumericValue {
    public var numericValue: String { "\(self)" }
}

extension Int: NumericValue {
    public var numericValue: String { "\(self)" }
}

extension Int8: NumericValue {
    public var numericValue: String { "\(self)" }
}

extension Int16: NumericValue {
    public var numericValue: String { "\(self)" }
}

extension Int32: NumericValue {
    public var numericValue: String { "\(self)" }
}

extension Int64: NumericValue {
    public var numericValue: String { "\(self)" }
}

extension Double: NumericValue {
    public var numericValue: String { "\(self)" }
}

extension Float32: NumericValue {
    public var numericValue: String { "\(self)" }
}
