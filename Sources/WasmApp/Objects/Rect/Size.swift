//
//  Size.swift
//  
//
//  Created by Mihael Isaev on 16.11.2020.
//

import Foundation

public final class Size: StateChangeable, Equatable, CustomStringConvertible {
    @State public var width: Double = 0
    @State public var height: Double = 0
    
    public init (width: Double, height: Double) {
        self.width = width
        self.height = height
        listenStates()
    }
    
    init(original: Size) {
        width = original.width
        height = original.height
    }
    
    public static var zero: Size { .init(width: 0, height: 0) }
    
    // MARK: StateChangeable
    
    lazy var prevSelf: Size = copy
    lazy var states: [AnyState] = [_width, _height]
    var manualUpdating: Bool = false
    
    var changed: (Size, Size) -> Void = { _,_ in }
    
    // MARK: Equatable
    
    public static func == (lhs: Size, rhs: Size) -> Bool {
        lhs.width == rhs.width && lhs.height == rhs.height
    }
    
    // MARK: CustomStringConvertible
    
    public var description: String {
        "Size(width: \(width) height: \(height))"
    }
}
