//
//  Size.swift
//  WebFoundation
//
//  Created by Mihael Isaev on 16.11.2020.
//

import Foundation

public final class Size: InnerStateChangeable, Equatable, CustomStringConvertible {
    @State public var width: Double = 0
    @State public var height: Double = 0
    
    public init (width: Double, height: Double) {
        self.width = width
        self.height = height
        innerStatesListen()
    }
    
    public init(original: Size) {
        width = original.width
        height = original.height
    }
    
    public static var zero: Size { .init(width: 0, height: 0) }
    
    // MARK: InnerStateChangeable
    
    public lazy var innerStatePrevSelf: Size = copy
    public lazy var innerStates: [AnyState] = [_width, _height]
    public var innerStateManualUpdating: Bool = false
    
    public var innerStateChanged: (Size, Size) -> Void = { _,_ in }
    
    // MARK: Equatable
    
    public static func == (lhs: Size, rhs: Size) -> Bool {
        lhs.width == rhs.width && lhs.height == rhs.height
    }
    
    // MARK: CustomStringConvertible
    
    public var description: String {
        "Size(width: \(width) height: \(height))"
    }
}
