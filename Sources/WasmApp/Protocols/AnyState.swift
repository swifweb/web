//
//  AnyState.swift
//  
//
//  Created by Mihael Isaev on 16.11.2020.
//

public protocol AnyState {
    func listen(_ listener: @escaping () -> Void)
}
