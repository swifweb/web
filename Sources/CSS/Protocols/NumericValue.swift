//
//  NumericValue.swift
//  CSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

import WebFoundation

public protocol NumericValue: CustomStringConvertible {
    var numericValue: String { get }
}

extension NumericValue {
    public var description: String { numericValue }
}

public class NumericValueContainer: CustomStringConvertible, _PropertyValueInnerChangeable {
    public var value: String
    
    var _changeHandler = {}
    
    public init<N> (_ value: N, important: Bool? = nil) where N: UniValue, N.UniValue: NumericValue {
        self.value = value.uniValue.numericValue + (important == true ? "!important" : "")
        value.uniStateValue?.listen {
            self.value = $0.numericValue + (important == true ? "!important" : "")
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
