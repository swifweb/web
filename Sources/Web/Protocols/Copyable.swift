//
//  Copyable.swift
//  
//
//  Created by Mihael Isaev on 17.11.2020.
//

protocol Copyable {
    init (original: Self)
}

extension Copyable {
    var copy: Self {
        .init(original: self)
    }
}
