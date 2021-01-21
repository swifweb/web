//
//  TransformOriginType.swift
//  Web
//
//  Created by Mihael Isaev on 08.07.2020.
//

public struct TransformOriginType: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    public static func value(x: XAxis, y: YAxis, z: ZAxis? = nil) -> Self {
        var values: [String] = [x.value, y.value]
        if let z = z {
            values.append(z.value)
        }
        return .init(values.joined(separator: " "))
    }
    
    public var description: String { value }
}
