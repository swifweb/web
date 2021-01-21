//
//  AngleValue.swift
//  Web
//
//  Created by Mihael Isaev on 08.07.2020.
//

public protocol AngleValue {
    var angleValue: String { get }
}

extension AngleValue {
    var ending: String { "deg" }
}

extension UInt: AngleValue {
    public var angleValue: String { "\(self)" + ending }
}

extension UInt8: AngleValue {
    public var angleValue: String { "\(self)" + ending }
}

extension UInt16: AngleValue {
    public var angleValue: String { "\(self)" + ending }
}

extension UInt32: AngleValue {
    public var angleValue: String { "\(self)" + ending }
}

extension UInt64: AngleValue {
    public var angleValue: String { "\(self)" + ending }
}

extension Int: AngleValue {
    public var angleValue: String { "\(self)" + ending }
}

extension Int8: AngleValue {
    public var angleValue: String { "\(self)" + ending }
}

extension Int16: AngleValue {
    public var angleValue: String { "\(self)" + ending }
}

extension Int32: AngleValue {
    public var angleValue: String { "\(self)" + ending }
}

extension Int64: AngleValue {
    public var angleValue: String { "\(self)" + ending }
}

extension Double: AngleValue {
    public var angleValue: String { "\(self)" + ending }
}

extension Float32: AngleValue {
    public var angleValue: String { "\(self)" + ending }
}
