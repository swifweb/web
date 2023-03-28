//
//  Routes.swift
//
//
//  Created by Mihael Isaev on 22.11.2020.
//  Credits to https://github.com/vapor/vapor
//

import Foundation

public final class RoutesStorage: RoutesBuilder, CustomStringConvertible {
    public var all: [any AnyRoute]
    
    /// Default routing behavior of `DefaultResponder` is case-sensitive; configure to `true` prior to
    /// Application start handle `Constant` `PathComponents` in a case-insensitive manner.
    public var caseInsensitive: Bool

    public var description: String {
        return self.all.description
    }

    public init() {
        self.all = []
        self.caseInsensitive = false
    }

    public func add(_ route: any AnyRoute) {
        self.all.append(route)
    }
}
