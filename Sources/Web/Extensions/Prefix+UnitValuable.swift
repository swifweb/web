//
//  Prefix+UnitValuable.swift
//  Web
//
//  Created by Mihael Isaev on 21.01.2021.
//

prefix operator -
public prefix func -<U>(rhs: U) -> UnitValue where U: UnitValuable {
    UnitValue(-1 * rhs.value.doubleValue, rhs.unit)
}

postfix operator %
public postfix func %<P: Percentable>(lhs: Double) -> P {
    .percent(lhs)
}
