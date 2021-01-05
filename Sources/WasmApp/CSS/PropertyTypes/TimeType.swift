//
//  TransitionDurationType.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

public struct TimeType: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Specifies how many seconds or milliseconds a transition effect takes to complete.
    /// Default value is 0s, meaning there will be no effect
    public static func time<V: TimeUnitValue>(_ v: V) -> Self { .init(v.description) }
    
    public var description: String { value }
}
