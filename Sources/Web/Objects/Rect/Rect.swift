//
//  Rect.swift
//  
//
//  Created by Mihael Isaev on 16.11.2020.
//

import Foundation

public final class Rect: StateChangeable, Equatable {
    @State public var x: Double = 0
    @State public var y: Double = 0
    @State public var width: Double = 0
    @State public var height: Double = 0
    
    public init (x: Double, y: Double, width: Double, height: Double) {
        self.x = x
        self.y = y
        self.width = width
        self.height = height
        listenStates()
    }
    
    init(original: Rect) {
        x = original.x
        y = original.y
        width = original.width
        height = original.height
    }
    
    public static var zero: Rect { .init(x: 0, y: 0, width: 0, height: 0) }
    
    // MARK: StateChangeable
    
    lazy var prevSelf: Rect = copy
    lazy var states: [AnyState] = [_x, _y, _width, _height]
    var manualUpdating: Bool = false
    
    var changed: (Rect, Rect) -> Void = { _,_ in }
    
    // MARK: Equatable
    
    public static func == (lhs: Rect, rhs: Rect) -> Bool {
        lhs.x == rhs.x && lhs.y == rhs.y && lhs.width == rhs.width && lhs.height == rhs.height
    }
    
    // MARK: CustomStringConvertible
    
    public var description: String {
        "Rect(x: \(x) y: \(y) width: \(width) height: \(height))"
    }
}
