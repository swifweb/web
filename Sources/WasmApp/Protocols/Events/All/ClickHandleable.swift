//
//  ClickHandleable.swift
//  WasmApp
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

public class HashChangeEvent: HandledEvent {
    /// Returns the URL of the document, after the hash has been changed
    public let newURL: String
    
    /// Returns the URL of the document, before the hash was changed
    public let oldURL: String
    
    override init (_ event: JSValue) {
        newURL = event.newURL.string ?? ""
        oldURL = event.oldURL.string ?? ""
        super.init(event)
    }
}

public class PageTransitionEvent: HandledEvent {
    /// Returns whether the webpage was cached by the browser
    public let persisted: Bool
    
    override init (_ event: JSValue) {
        persisted = event.persisted.boolean ?? false
        super.init(event)
    }
}

public class ProgressEvent: HandledEvent {
    /// Returns whether the length of the progress can be computable or not
    public let lengthComputable: Bool
    
    /// Returns how much work has been loaded
    public let loaded: Bool
    
    /// Returns the total amount of work that will be loaded
    public let total: Int
    
    override init (_ event: JSValue) {
        lengthComputable = event.lengthComputable.boolean ?? false
        loaded = event.loaded.boolean ?? false
        total = Int(event.total.number ?? 0)
        super.init(event)
    }
}

public class StorageEvent: HandledEvent {
    /// Returns the key of the changed storage item
    public let key: String
    
    /// Returns the new value of the changed storage item
    public let newValue: JSValue
    
    /// Returns the old value of the changed storage item
    public let oldValue: JSValue
    
    /// Returns an object representing the affected storage object
    public let storageArea: JSValue
    
    /// Returns the URL of the changed item's document
    public let url: String
    
    override init (_ event: JSValue) {
        key = event.key.string ?? ""
        newValue = event.newValue
        oldValue = event.oldValue
        storageArea = event.storageArea
        url = event.url.string ?? ""
        super.init(event)
    }
}

public class TransitionEvent: HandledEvent {
    /// Returns the name of the transition
    public let propertyName: String
    
    /// Returns the number of seconds a transition has been running
    public let elapsedTime: Int
    
    /// Returns the name of the pseudo-element of the transition
    public let pseudoElement: String
    
    override init (_ event: JSValue) {
        propertyName = event.propertyName.string ?? ""
        elapsedTime = Int(event.elapsedTime.number ?? 0)
        pseudoElement = event.pseudoElement.string ?? ""
        super.init(event)
    }
}

public class UIEvent: HandledEvent {
    /// Returns a number with details about the event
    public let detail: Int
    
    /// Returns a reference to the Window object where the event occurred
    public let view: JSValue
    
    override init (_ event: JSValue) {
        detail = Int(event.detail.number ?? 0)
        view = event.view
        super.init(event)
    }
}

public enum WheelEventDeltaMode: Int {
    case unknown = -1
    case pixels = 0
    case lines
    case pages
}

public class WheelEvent: MouseEvent {
    /// Returns the horizontal scroll amount of a mouse wheel (x-axis)
    public let deltaX: Int
    
    /// Returns the vertical scroll amount of a mouse wheel (y-axis)
    public let deltaY: Int
    
    /// Returns the scroll amount of a mouse wheel for the z-axis
    public let deltaZ: Int
    
    /// Returns a number that represents the unit of measurements for delta values (pixels, lines or pages)
    public let deltaMode: WheelEventDeltaMode
    
    override init (_ event: JSValue) {
        deltaX = Int(event.deltaX.number ?? 0)
        deltaY = Int(event.deltaY.number ?? 0)
        deltaZ = Int(event.deltaZ.number ?? 0)
        deltaMode = WheelEventDeltaMode(rawValue: Int(event.deltaMode.number ?? -1)) ?? .unknown
        super.init(event)
    }
}

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
    
    override init (_ event: JSValue) {
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

public enum InputType: String {
    case insertText
    case insertReplacementText
    case insertLineBreak
    case insertParagraph
    case insertOrderedList
    case insertUnorderedList
    case insertHorizontalRule
    case insertFromYank
    case insertFromDrop
    case insertFromPaste
    case insertTranspose
    case insertCompositionText
    case insertFromComposition
    case insertLink
    case deleteByComposition
    case deleteCompositionText
    case deleteWordBackward
    case deleteWordForward
    case deleteSoftLineBackward
    case deleteSoftLineForward
    case deleteEntireSoftLine
    case deleteHardLineBackward
    case deleteHardLineForward
    case deleteByDrag
    case deleteByCut
    case deleteByContent
    case deleteContentBackward
    case deleteContentForward
    case historyUndo
    case historyRedo
    case formatBold
    case formatItalic
    case formatUnderline
    case formatStrikethrough
    case formatSuperscript
    case formatSubscript
    case formatJustifyFull
    case formatJustifyCenter
    case formatJustifyRight
    case formatJustifyLeft
    case formatIndent
    case formatOutdent
    case formatRemove
    case formatSetBlockTextDirection
    case formatSetInlineTextDirection
    case formatBackColor
    case formatFontColor
    case formatFontName
    case unknown
}

public class InputEvent: UIEvent {
    /// Returns the inserted characters
    public let data: String
    
    /// Returns an object containing information about the inserted/deleted data
    public let dataTransfer: DataTransferObject
    
//    /// Returns an array containing target ranges that will be affected by the insertion/deletion
//    public func getTargetRanges() -> [] {
//
//    }
    
    /// Returns the type of the change (i.e "inserting" or "deleting")
    public let inputType: InputType
    
    /// Returns whether the state of the event is composing or not
    public let isComposing: Bool
    
    override init (_ event: JSValue) {
        data = event.data.string ?? ""
        dataTransfer = DataTransferObject(event.dataTransfer)
        inputType = InputType(rawValue: event.inputType.string ?? "") ?? .unknown
        isComposing = event.isComposing.boolean ?? false
        super.init(event)
    }
}

public class FocusEvent: UIEvent {
//    /// Returns the element related to the element that triggered the event
//    public let relatedTarget: JSValue?
    
    override init (_ event: JSValue) {
        super.init(event)
    }
}

public class MouseEvent: UIEvent {
    /// The altKey property returns a `Boolean` value that indicates
    /// whether or not the "ALT" key was pressed when a mouse event was triggered.
    public let altKey: Bool
    
    /// Returns which mouse button was pressed when the mouse event was triggered
    public let button: Int
    
    /// Returns which mouse buttons were pressed when the mouse event was triggered
    public let buttons: [Int]
    
    /// Returns the horizontal coordinate of the mouse pointer, relative to the current window, when the mouse event was triggered
    public let clientX: Int
    
    /// Returns the vertical coordinate of the mouse pointer, relative to the current window, when the mouse event was triggered
    public let clientY: Int
    
    /// Returns whether the "CTRL" key was pressed when the key event was triggered
    public let ctrlKey: Bool
    
    /// Returns true if the specified key is activated
    public func getModifierState() -> Bool {
        event.getModifierState.function?.callAsFunction(this: event.object).boolean ?? false
    }
    
    /// Returns whether the "meta" key was pressed when the key event was triggered
    public let metaKey: Bool
    
    /// Returns the horizontal coordinate of the mouse pointer relative to the position of the last mousemove event
    public let movementX: Int
    
    /// Returns the vertical coordinate of the mouse pointer relative to the position of the last mousemove event
    public let movementY: Int
    
    /// Returns the horizontal coordinate of the mouse pointer relative to the position of the edge of the target element
    public let offsetX: Int
    
    /// Returns the vertical coordinate of the mouse pointer relative to the position of the edge of the target element
    public let offsetY: Int
    
    /// Returns the horizontal coordinate of the mouse pointer, relative to the document, when the mouse event was triggered
    public let pageX: Int
    
    /// Returns the vertical coordinate of the mouse pointer, relative to the document, when the mouse event was triggered
    public let pageY: Int
    
//    region
//
//    /// Returns the element related to the element that triggered the mouse event
//    public let relatedTarget: JSValue?
    
    /// Returns the horizontal coordinate of the mouse pointer, relative to the screen, when an event was triggered
    public let screenX: Int
    
    /// Returns the vertical coordinate of the mouse pointer, relative to the screen, when an event was triggered
    public let screenY: Int
    
    /// Returns whether the "SHIFT" key was pressed when the key event was triggered
    public let shiftKey: Bool
    
    /// Returns the Unicode character code of the key that triggered the onkeypress event,
    /// or the Unicode key code of the key that triggered the onkeydown or onkeyup event
    public let which: Int
    
    override init (_ event: JSValue) {
        altKey = event.altKey.boolean ?? false
        button = Int(event.button.number ?? 0)
        if let v = event.buttons.object, let arr = JSArray(v) {
            var buttons: [Int] = []
            let iterator = arr.makeIterator()
            while let val = iterator.next() {
                buttons.append(Int(val.number ?? 0))
            }
            self.buttons = buttons
        } else {
            buttons = []
        }
        clientX = Int(event.clientX.number ?? 0)
        clientY = Int(event.clientY.number ?? 0)
        ctrlKey = event.ctrlKey.boolean ?? false
        metaKey = event.metaKey.boolean ?? false
        movementX = Int(event.movementX.number ?? 0)
        movementY = Int(event.movementY.number ?? 0)
        offsetX = Int(event.offsetX.number ?? 0)
        offsetY = Int(event.offsetY.number ?? 0)
        pageX = Int(event.pageX.number ?? 0)
        pageY = Int(event.pageY.number ?? 0)
        screenX = Int(event.screenX.number ?? 0)
        screenY = Int(event.screenY.number ?? 0)
        shiftKey = event.shiftKey.boolean ?? false
        which = Int(event.which.number ?? 0)
        super.init(event)
    }
}

public enum KeyboardEventLocation: Int {
    /// The key is not pressed on the right or left side of the keyboard,
    /// and was not pressed on the numeric keypad
    /// (this value represents almost every key on the keyboard, e.g. "A", "U", "SPACE" or "5")
    case standard = 0
    
    /// A left key was pressed (e.g. the left "CTRL" key or left "ALT" key on a standard 101 key US keyboard)
    case left
    
    /// A right key was pressed (e.g. the right "CTRL" key or right "CTRL" key on a standard 101 key US keyboard)
    case right
    
    /// The key was pressed on the numeric keypad (e.g. the "2" key on the right side on a standard keyboard)
    case numpad
}

public class KeyboardEvent: UIEvent {
    /// The altKey property returns a `Boolean` value that indicates
    /// whether or not the "ALT" key was pressed when a keyboard event was triggered.
    public let altKey: Bool
    
    /// Returns the Unicode character code of the key that triggered the event
    public let charCode: Int
    
    /// Returns the code of the key that triggered the event
    public let code: String
    
    /// Returns whether the "CTRL" key was pressed when the key event was triggered
    public let ctrlKey: Bool
    
    /// Returns true if the specified key is activated
    public func getModifierState() -> Bool {
        event.getModifierState.function?.callAsFunction(this: event.object).boolean ?? false
    }
    
    /// Returns whether the state of the event is composing or not
    public let isComposing: Bool
    
    /// Returns the key value of the key represented by the event
    public let key: String
    
    /// Returns the Unicode character code of the key that triggered the `onkeypress` event,
    /// or the Unicode key code of the key that triggered the `onkeydown` or `onkeyup` event
    public let keyCode: Int
    
    /// Returns the location of a key on the keyboard or device
    public let location: KeyboardEventLocation
    
    /// Returns whether the "meta" key was pressed when the key event was triggered
    public let metaKey: Bool
    
    /// Returns whether a key is being hold down repeatedly, or not
    public let `repeat`: Bool
    
    /// Returns whether the "SHIFT" key was pressed when the key event was triggered
    public let shiftKey: Bool
    
    /// Returns the Unicode character code of the key that triggered the onkeypress event,
    /// or the Unicode key code of the key that triggered the onkeydown or onkeyup event
    public let which: Int
    
    override init (_ event: JSValue) {
        altKey = event.altKey.boolean ?? false
        charCode = Int(event.charCode.number ?? 0)
        code = event.code.string ?? ""
        ctrlKey = event.ctrlKey.boolean ?? false
        isComposing = event.isComposing.boolean ?? false
        key = event.key.string ?? ""
        keyCode = Int(event.keyCode.number ?? 0)
        location = KeyboardEventLocation(rawValue: Int(event.location.number ?? 0)) ?? .standard
        metaKey = event.metaKey.boolean ?? false
        `repeat` = event.repeat.boolean ?? false
        shiftKey = event.shiftKey.boolean ?? false
        which = Int(event.which.number ?? 0)
        super.init(event)
    }
}

public class DragEvent: MouseEvent {
    /// Returns the data that is dragged/dropped
    public let dataTransfer: DataTransferObject
    
    override init (_ event: JSValue) {
        dataTransfer = DataTransferObject(event.dataTransfer)
        super.init(event)
    }
}

/// [More info →](https://developer.mozilla.org/en-US/docs/Web/API/Blob)
public class Blob {
    let object: JSValue
    
    /// The size, in bytes, of the data contained in the Blob object.
    public let size: Int
    
    /// A string indicating the MIME type of the data contained in the Blob.
    /// If the type is unknown, this string is empty.
    public let type: String
    
//    /// Returns a promise that resolves with an ArrayBuffer containing the entire contents of the Blob as binary data.
//    public func arrayBuffer() {}
//
//    /// Returns a new Blob object containing the data in the specified range of bytes of the blob on which it's called.
//    public func slice() {}
//
//    /// Returns a ReadableStream that can be used to read the contents of the Blob.
//    public func stream() {}
//
//    /// Returns a promise that resolves with a USVString containing the entire contents of the Blob interpreted as UTF-8 text.
//    public func text() {}
    
    init (_ object: JSValue) {
        self.object = object
        size = Int(object.size.number ?? 0)
        type = object.type.string ?? ""
    }
}

/// [More info →](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date)
class _JSDate {
    let object: JSValue
    
    /// Returns the milliseconds since the UTC epoch
    func getTime() -> Int {
        Int(object.getUTCSeconds.function?.callAsFunction(this: object.object).number ?? 0)
    }
    
    init (_ object: JSValue) {
        self.object = object
    }
}

/// [More info →](https://developer.mozilla.org/en-US/docs/Web/API/File/File)
public class File: Blob {
    /// Returns the last modified time of the file,
    /// in millisecond since the UNIX epoch (January 1st, 1970 at Midnight).
    public let lastModified: Int
    
    /// Returns the last modified Date of the file referenced by the File object.
    public let lastModifiedDate: Date
    
    /// Returns the name of the file referenced by the File object.
    public let name: String
    
//    /// Returns the path the URL of the File is relative to.
//    public let webkitRelativePath: String
    
    override init (_ object: JSValue) {
        lastModified = Int(object.lastModified.number ?? 0)
        lastModifiedDate = Date(timeIntervalSince1970: TimeInterval(_JSDate(object.lastModifiedDate).getTime() / 1_000))
        name = object.name.string ?? ""
        super.init(object)
    }
}

public enum DataTransferDropEffect: String {
    case none, copy, link, move
}

public enum DataTransferEffectAllowed: String {
    case none, copy, copyLink, copyMove, link, linkMove, move, all, uninitialize
}

public enum DataTransferItemKind: String {
    case string, file, unknown
}

public class DataTransferItem {
    let object: JSValue
    
    /// The kind of drag data item, string or file.
    public let kind: DataTransferItemKind
    
    /// The drag data item's type, typically a MIME type.
    public let type: String
    
    init (_ object: JSValue) {
        self.object = object
        kind = DataTransferItemKind(rawValue: object.kind.string ?? "") ?? .unknown
        type = object.type.string ?? ""
    }
}

public protocol ClickHandleable {
    @discardableResult
    func onClick(_ handler: @escaping () -> Void) -> Self
}

protocol _ClickHandleable: _AnyElement, ClickHandleable {
    typealias ClickClosure = JSClosure
    
    var clickClosure: ClickClosure? { get set }
    var clickHandler: (MouseEvent) -> Void { get set }
}

extension ClickHandleable {
    /// The `onclick` event occurs when the user clicks on an element.
    ///
    /// Applicable to all tags
    ///including SVG: <image>, <line>, <linearGradient>, <marker>, <metadata>, <mpath>,
    /// <path>, <pattern>, <polygon>, <polyline>, <radialGradient>, <rect>,
    /// <script>, <set>, <stop>, <style>, <svg>, <switch>, <symbol>,
    /// <text>, <textPath>, <title>, <tref>, <tspan>, <use>, <view>
    /// except: <base>, <bdo>, <br>, <head>, <html>, <iframe>, <meta>, <param>, <script>, <style>, and <title>.
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onclick.asp)
    @discardableResult
    public func onClick(_ handler: @escaping (MouseEvent) -> Void) -> Self {
        guard let s = self as? _ClickHandleable else { return self }
        s.clickClosure?.release()
        s.clickClosure = JSClosure { event in
            s.clickHandler(MouseEvent(event.jsValue()))
        }
        s.domElement.onclick = s.clickClosure.jsValue()
        s.clickHandler = handler
        return self
    }
    
    @discardableResult
    public func onClick(_ handler: @escaping () -> Void) -> Self {
        onClick { _ in handler() }
    }
}
