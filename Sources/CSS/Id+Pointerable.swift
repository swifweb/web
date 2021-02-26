//
//  Id+Pointerable.swift
//  CSS
//
//  Created by Mihael Isaev on 26.02.2021.
//

import DOM

extension Id: Pointerable {
    public var pointer: Pointer { .init("#" + name) }
}
