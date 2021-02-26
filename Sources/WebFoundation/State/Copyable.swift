//
//  Copyable.swift
//  WebFoundation
//
//  Created by Mihael Isaev on 17.11.2020.
//

public protocol Copyable {
    init (original: Self)
}

extension Copyable {
    public var copy: Self {
        .init(original: self)
    }
}
