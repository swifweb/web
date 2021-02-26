//
//  Rect.swift
//  WebFoundation
//
//  Created by Mihael Isaev on 16.11.2020.
//

import Foundation

public final class Rect: InnerStateChangeable, Equatable {
    @State public var x: Double = 0
    @State public var y: Double = 0
    @State public var width: Double = 0
    @State public var height: Double = 0
    
    public init (x: Double, y: Double, width: Double, height: Double) {
        self.x = x
        self.y = y
        self.width = width
        self.height = height
        innerStatesListen()
    }
    
    public init(original: Rect) {
        x = original.x
        y = original.y
        width = original.width
        height = original.height
    }
    
    public static var zero: Rect { .init(x: 0, y: 0, width: 0, height: 0) }
    
    // MARK: InnerStateChangeable
    
    public lazy var innerStatePrevSelf: Rect = copy
    public lazy var innerStates: [AnyState] = [_x, _y, _width, _height]
    public var innerStateManualUpdating: Bool = false
    
    public var innerStateChanged: (Rect, Rect) -> Void = { _,_ in }
    
    // MARK: Equatable
    
    public static func == (lhs: Rect, rhs: Rect) -> Bool {
        lhs.x == rhs.x && lhs.y == rhs.y && lhs.width == rhs.width && lhs.height == rhs.height
    }
    
    // MARK: CustomStringConvertible
    
    public var description: String {
        "Rect(x: \(x) y: \(y) width: \(width) height: \(height))"
    }
}
