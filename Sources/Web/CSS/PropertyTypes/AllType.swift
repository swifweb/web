//
//  AllType.swift
//  Web
//
//  Created by Mihael Isaev on 10.07.2020.
//

public struct AllType: Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Changes all the properties applied to the element
    /// or the element's parent to their parent value
    /// if they are inheritable or to their initial value if not
    public static var unset: Self { .init("unset") }
    
    public var description: String { value }
}
