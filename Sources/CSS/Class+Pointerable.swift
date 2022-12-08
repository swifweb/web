//
//  Class+Pointerable.swift
//  CSS
//
//  Created by Mihael Isaev on 26.02.2021.
//

import DOM

extension Class: Pointerable {
    public var pointer: Pointer { .init(names.map { ".\($0)" }.joined(separator: "")) }
}
