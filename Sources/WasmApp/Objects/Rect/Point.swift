//
//  File.swift
//  
//
//  Created by Mihael Isaev on 16.11.2020.
//

import Foundation

public final class Point: StateChangeable, Equatable, CustomStringConvertible {
    @State public var x: Double = 0
    @State public var y: Double = 0
    
    public init (x: Double, y: Double) {
        self.x = x
        self.y = y
        listenStates()
    }
    
    init(original: Point) {
        x = original.x
        y = original.y
    }
    
    public static var zero: Point { .init(x: 0, y: 0) }
    
    // MARK: StateChangeable
    
    lazy var prevSelf: Point = copy
    lazy var states: [AnyState] = [_x, _y]
    var manualUpdating: Bool = false
    
    var changed: (Point, Point) -> Void = { _,_ in }
    
    // MARK: Equatable
    
    public static func == (lhs: Point, rhs: Point) -> Bool {
        lhs.x == rhs.x && lhs.y == rhs.y
    }
    
    // MARK: CustomStringConvertible
    
    public var description: String {
        "Point(x: \(x) y: \(y))"
    }
}
