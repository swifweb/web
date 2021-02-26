//
//  TouchEvent.swift
//  Events
//
//  Created by Mihael Isaev on 24.02.2021.
//

import JavaScriptKit

public class TouchEvent: UIEvent {
    /// Returns whether the "ALT" key was pressed when the touch event was triggered
    public let altKey: Bool
    
    /// Returns a list of all the touch objects whose state changed between the previous touch and this touch
    public let changedTouches: [TouchObject]
    
    /// Returns whether the "CTRL" key was pressed when the touch event was triggered
    public let ctrlKey: Bool
    
    /// Returns whether the "meta" key was pressed when the touch event was triggered
    public let metaKey: Bool
    
    /// Returns whether the "SHIFT" key was pressed when the touch event was triggered
    public let shiftKey: Bool
    
    /// Returns a list of all the touch objects that are in contact with the surface
    /// and where the touchstart event occured on the same target element as the current target element
    public let targetTouches: [TouchObject]
    
    /// Returns a list of all the touch objects that are currently in contact with the surface
    public let touches: [TouchObject]
    
    /// Change in rotation (in degrees) since the event's beginning.
    /// Positive values indicate clockwise rotation;
    /// negative values indicate anticlockwise rotation.
    /// Initial value: 0.0
    public let rotation: Double
    
    /// Distance between two digits since the event's beginning.
    /// Expressed as a floating-point multiple of the initial distance
    /// between the digits at the beginning of the event.
    /// Values below 1.0 indicate an inward pinch (zoom out).
    /// Values above 1.0 indicate an outward unpinch (zoom in).
    /// Initial value: 1.0
    public let scale: Double
    
    required init (_ event: JSValue) {
        altKey = event.altKey.boolean ?? false
        if let v = event.changedTouches.object, let arr = JSArray(v) {
            var changedTouches: [TouchObject] = []
            let iterator = arr.makeIterator()
            while let val = iterator.next() {
                changedTouches.append(TouchObject(val))
            }
            self.changedTouches = changedTouches
        } else {
            changedTouches = []
        }
        ctrlKey = event.ctrlKey.boolean ?? false
        metaKey = event.metaKey.boolean ?? false
        shiftKey = event.shiftKey.boolean ?? false
        if let v = event.targetTouches.object, let arr = JSArray(v) {
            var targetTouches: [TouchObject] = []
            let iterator = arr.makeIterator()
            while let val = iterator.next() {
                targetTouches.append(TouchObject(val))
            }
            self.targetTouches = targetTouches
        } else {
            targetTouches = []
        }
        if let v = event.touches.object, let arr = JSArray(v) {
            var touches: [TouchObject] = []
            let iterator = arr.makeIterator()
            while let val = iterator.next() {
                touches.append(TouchObject(val))
            }
            self.touches = touches
        } else {
            touches = []
        }
        rotation = event.rotation.number ?? 0
        scale = event.scale.number ?? 0
        super.init(event)
    }
}
