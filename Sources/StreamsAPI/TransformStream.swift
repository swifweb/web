//
//  TransformStream.swift
//  StreamsAPI
//
//  Created by Mihael Isaev on 19.03.2021.
//

import WebFoundation

/// Represents a set of transformable data
public protocol TransformStream {
    var transformContent: JSValue { get }
}
