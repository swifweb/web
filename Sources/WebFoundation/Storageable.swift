//
//  Storageable.swift
//  WebFoundation
//
//  Created by Mihael Isaev on 24.02.2021.
//

public protocol Storageable: AnyObject {
    var storage: Storage { get set }
}
