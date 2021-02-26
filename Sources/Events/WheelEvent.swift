//
//  WheelEvent.swift
//  Events
//
//  Created by Mihael Isaev on 24.02.2021.
//

import JavaScriptKit

public class WheelEvent: MouseEvent {
    /// Returns the horizontal scroll amount of a mouse wheel (x-axis)
    public let deltaX: Int
    
    /// Returns the vertical scroll amount of a mouse wheel (y-axis)
    public let deltaY: Int
    
    /// Returns the scroll amount of a mouse wheel for the z-axis
    public let deltaZ: Int
    
    /// Returns a number that represents the unit of measurements for delta values (pixels, lines or pages)
    public let deltaMode: WheelEventDeltaMode
    
    required init (_ event: JSValue) {
        deltaX = Int(event.deltaX.number ?? 0)
        deltaY = Int(event.deltaY.number ?? 0)
        deltaZ = Int(event.deltaZ.number ?? 0)
        deltaMode = WheelEventDeltaMode(rawValue: Int(event.deltaMode.number ?? -1)) ?? .unknown
        super.init(event)
    }
}
