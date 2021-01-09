//
//  StepsType.swift
//  WasmApp
//
//  Created by Mihael Isaev on 08.07.2020.
//

public enum StepsType: String, CustomStringConvertible {
    case start, end
    
    public var description: String { rawValue }
}
