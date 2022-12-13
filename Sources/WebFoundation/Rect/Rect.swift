//
//  Rect.swift
//  WebFoundation
//
//  Created by Mihael Isaev on 16.11.2020.
//

import Foundation

public final class Rect: InnerStateChangeable, Equatable, CustomStringConvertible {
    @State public var x: Double = 0
    @State public var y: Double = 0
    @State public var width: Double = 0
    @State public var height: Double = 0
    @State public var top: Double = 0
    @State public var right: Double = 0
    @State public var bottom: Double = 0
    @State public var left: Double = 0
    
    public init (x: Double, y: Double, width: Double, height: Double, top: Double, right: Double, bottom: Double, left: Double) {
        self.x = x
        self.y = y
        self.width = width
        self.height = height
        self.top = top
        self.right = right
        self.bottom = bottom
        self.left = left
        innerStatesListen()
    }
    
    public init(original: Rect) {
        x = original.x
        y = original.y
        width = original.width
        height = original.height
        top = original.top
        right = original.right
        bottom = original.bottom
        left = original.left
    }
    
    public init (_ jsValue: JSValue) {
        x = jsValue.object?["x"].jsValue.number ?? 0
        y = jsValue.object?["y"].jsValue.number ?? 0
        width = jsValue.object?["width"].jsValue.number ?? 0
        height = jsValue.object?["height"].jsValue.number ?? 0
        top = jsValue.object?["top"].jsValue.number ?? 0
        right = jsValue.object?["right"].jsValue.number ?? 0
        bottom = jsValue.object?["bottom"].jsValue.number ?? 0
        left = jsValue.object?["left"].jsValue.number ?? 0
    }
    
    public static var zero: Rect { .init(x: 0, y: 0, width: 0, height: 0, top: 0, right: 0, bottom: 0, left: 0) }
    
    // MARK: InnerStateChangeable
    
    public lazy var innerStatePrevSelf: Rect = copy
    public lazy var innerStates: [AnyState] = [_x, _y, _width, _height, _top, _right, _bottom, _left]
    public var innerStateManualUpdating: Bool = false
    
    public var innerStateChanged: (Rect, Rect) -> Void = { _,_ in }
    
    // MARK: Equatable
    
    public static func == (lhs: Rect, rhs: Rect) -> Bool {
        lhs.x == rhs.x
            && lhs.y == rhs.y
            && lhs.width == rhs.width
            && lhs.height == rhs.height
            && lhs.top == rhs.top
            && lhs.right == rhs.right
            && lhs.bottom == rhs.bottom
            && lhs.left == rhs.left
    }
    
    // MARK: CustomStringConvertible
    
    public var description: String {
        "Rect(x: \(x) y: \(y) width: \(width) height: \(height) top: \(top) right: \(right) bottom: \(bottom) left: \(left))"
    }
}
