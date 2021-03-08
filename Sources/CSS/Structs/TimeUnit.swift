//
//  TimeUnit.swift
//  CSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

import WebFoundation

public enum TimeUnit: String, UniValue {
    case s, ms
    
    public static var `default`: Self { .s }
    
    public var uniValue: TimeUnit { self }
    public var uniStateValue: State<TimeUnit>? { nil }
}
