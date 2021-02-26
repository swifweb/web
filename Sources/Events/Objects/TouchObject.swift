//
//  TouchObject.swift
//  Events
//
//  Created by Mihael Isaev on 24.02.2021.
//

import JavaScriptKit

public class TouchObject {
    let object: JSValue
    
    /// Returns a unique identifier for this Touch object.
    /// A given touch point (say, by a finger) will have the same identifier
    /// for the duration of its movement around the surface.
    /// This lets you ensure that you're tracking the same touch all the time.
    public let identifier: String
    
    /// Returns the X coordinate of the touch point relative to the left edge of the screen.
    public let screenX: Int
    
    /// Returns the Y coordinate of the touch point relative to the top edge of the screen.
    public let screenY: Int
    
    /// Returns the X coordinate of the touch point relative to the left edge of the browser viewport, not including any scroll offset.
    public let clientX: Int
    
    /// Returns the Y coordinate of the touch point relative to the top edge of the browser viewport, not including any scroll offset.
    public let clientY: Int
    
    /// Returns the X coordinate of the touch point relative to the left edge of the document.
    /// Unlike clientX, this value includes the horizontal scroll offset, if any.
    public let pageX: Int
    
    /// Returns the Y coordinate of the touch point relative to the top of the document.
    /// Unlike clientY, this value includes the vertical scroll offset, if any.
    public let pageY: Int
    
    /// Returns the Element on which the touch point started when it was first placed on the surface,
    /// even if the touch point has since moved outside the interactive area
    /// of that element or even been removed from the document.
    public let target: JSValue
    
    // Experimental
    
    /// Returns the X radius of the ellipse that most closely circumscribes the area of contact with the screen.
    /// The value is in pixels of the same scale as screenX.
    public let radiusX: Int
    
    /// Returns the Y radius of the ellipse that most closely circumscribes the area of contact with the screen.
    /// The value is in pixels of the same scale as screenY.
    public let radiusY: Int
    
    /// Returns the angle (in degrees) that the ellipse
    /// described by radiusX and radiusY must be rotated, clockwise, to most accurately cover the area
    /// of contact between the user and the surface.
    public let rotationAngle: Double
    
    /// Returns the amount of pressure being applied to the surface by the user,
    /// as a float between 0.0 (no pressure) and 1.0 (maximum pressure).
    public let force: Double
    
    init (_ object: JSValue) {
        identifier = object.identifier.string ?? ""
        screenX = Int(object.screenX.number ?? 0)
        screenY = Int(object.screenY.number ?? 0)
        clientX = Int(object.clientX.number ?? 0)
        clientY = Int(object.clientY.number ?? 0)
        pageX = Int(object.pageX.number ?? 0)
        pageY = Int(object.pageY.number ?? 0)
        target = object.target
        radiusX = Int(object.radiusX.number ?? 0)
        radiusY = Int(object.radiusY.number ?? 0)
        rotationAngle = object.rotationAngle.number ?? 0
        force = object.force.number ?? 0
        self.object = object
    }
}
