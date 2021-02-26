//
//  LoadingType.swift
//  DOM
//
//  Created by Mihael Isaev on 22.12.2020.
//

import Foundation

public final class LoadingType {
    public let value: String
    
    public init (_ value: String) {
        self.value = value
    }
    
    /// Default.
    /// Loads an image immediately
    public static var eager: LoadingType { .init("eager") }
    
    /// Defer loading of images until some conditions are met
    public static var lazy: LoadingType { .init("lazy") }
}
