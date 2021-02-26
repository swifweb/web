//
//  Point.swift
//  WebFoundation
//
//  Created by Mihael Isaev on 16.11.2020.
//

import Foundation

public final class Point: InnerStateChangeable, Equatable, CustomStringConvertible {
    @State public var x: Double = 0
    @State public var y: Double = 0
    
    public init (x: Double, y: Double) {
        self.x = x
        self.y = y
        innerStatesListen()
    }
    
    public init(original: Point) {
        x = original.x
        y = original.y
    }
    
    public static var zero: Point { .init(x: 0, y: 0) }
    
    // MARK: InnerStateChangeable
    
    public lazy var innerStatePrevSelf: Point = copy
    public lazy var innerStates: [AnyState] = [_x, _y]
    public var innerStateManualUpdating: Bool = false
    
    public var innerStateChanged: (Point, Point) -> Void = { _,_ in }
    
    // MARK: Equatable
    
    public static func == (lhs: Point, rhs: Point) -> Bool {
        lhs.x == rhs.x && lhs.y == rhs.y
    }
    
    // MARK: CustomStringConvertible
    
    public var description: String {
        "Point(x: \(x) y: \(y))"
    }
}
