//
//  TimeUnit.swift
//  CSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

import WebFoundation

public struct TimeUnit: UniValue, _StringPropertyValue, PropertyValueImportantable {
    let value: String
    
    init (_ value: String) {
        self.value = value
    }

    public static var s: Self { .init("s") }
    public static var ms: Self { .init("ms") }
    
    public static var `default`: Self { .s }
    
    public var uniValue: TimeUnit { self }
    public var uniStateValue: State<TimeUnit>? { nil }
    
    public var description: String { value }
}
