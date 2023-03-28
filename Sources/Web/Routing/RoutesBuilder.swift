//
//  RoutesBuilder.swift
//
//
//  Created by Mihael Isaev on 22.11.2020.
//  Credits to https://github.com/vapor/vapor
//

import Foundation

public protocol RoutesBuilder {
    func add(_ route: any AnyRoute)
}
