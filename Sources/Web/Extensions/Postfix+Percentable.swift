//
//  Postfix+Percentable.swift
//  Web
//
//  Created by Mihael Isaev on 21.01.2021.
//

postfix operator %
public postfix func %<P: Percentable>(lhs: Double) -> P {
    .percent(lhs)
}
