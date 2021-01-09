//
//  CursorType.swift
//  WasmApp
//
//  Created by Mihael Isaev on 10.07.2020.
//

public struct CursorType: Autoable, Noneable, Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// The cursor indicates an alias of something is to be created
    public static var alias: Self { .init("alias") }
    
    /// The cursor indicates that something can be scrolled in any direction
    public static var allScroll: Self { .init("all-scroll") }
    
    /// The cursor indicates that a cell (or set of cells) may be selected
    public static var cell: Self { .init("cell") }
    
    /// The cursor indicates that a context-menu is available
    public static var contextMenu: Self { .init("context-menu") }
    
    /// The cursor indicates that the column can be resized horizontally
    public static var colResize: Self { .init("col-resize") }
    
    /// The cursor indicates something is to be copied
    public static var copy: Self { .init("copy") }
    
    /// The cursor render as a crosshair
    public static var crosshair: Self { .init("crosshair") }
    
    /// The default cursor
    public static var `default`: Self { .init("default") }
    
    /// The cursor indicates that an edge of a box is to be moved right (east)
    public static var eResize: Self { .init("e-resize") }
    
    /// Indicates a bidirectional resize cursor
    public static var ewResize: Self { .init("ew-resize") }
    
    /// The cursor indicates that something can be grabbed
    public static var grab: Self { .init("grab") }
    
    /// The cursor indicates that something can be grabbed
    public static var grabbing: Self { .init("grabbing") }
    
    /// The cursor indicates that help is available
    public static var help: Self { .init("help") }
    
    /// The cursor indicates something is to be moved
    public static var move: Self { .init("move") }
    
    /// The cursor indicates that an edge of a box is to be moved up (north)
    public static var nResize: Self { .init("n-resize") }
    
    /// The cursor indicates that an edge of a box is to be moved up and right (north/east)
    public static var neResize: Self { .init("ne-resize") }
    
    /// Indicates a bidirectional resize cursor
    public static var neswResize: Self { .init("nesw-resize") }
    
    /// Indicates a bidirectional resize cursor
    public static var nsResize: Self { .init("ns-resize") }
    
    /// The cursor indicates that an edge of a box is to be moved up and left (north/west)
    public static var nwResize: Self { .init("nw-resize") }
    
    /// Indicates a bidirectional resize cursor
    public static var nwseResize: Self { .init("nwse-resize") }
    
    /// The cursor indicates that the dragged item cannot be dropped here
    public static var noDrop: Self { .init("no-drop") }
    
    /// The cursor indicates that the requested action will not be executed
    public static var notAllowed: Self { .init("not-allowed") }
    
    /// The cursor is a pointer and indicates a link
    public static var pointer: Self { .init("pointer") }
    
    /// The cursor indicates that the program is busy (in progress)
    public static var progress: Self { .init("progress") }
    
    /// The cursor indicates that the row can be resized vertically
    public static var rowResize: Self { .init("row-resize") }
    
    /// The cursor indicates that an edge of a box is to be moved down (south)
    public static var sResize: Self { .init("s-resize") }
    
    /// The cursor indicates that an edge of a box is to be moved down and right (south/east)
    public static var seResize: Self { .init("se-resize") }
    
    /// The cursor indicates that an edge of a box is to be moved down and left (south/west)
    public static var swResize: Self { .init("sw-resize") }
    
    /// The cursor indicates text that may be selected
    public static var text: Self { .init("text") }
    
    /// A comma separated list of URLs to custom cursors. Note: Always specify a generic cursor at the end of the list, in case none of the URL-defined cursors can be used
    public static var url: Self { .init("URL") }
    
    /// The cursor indicates vertical-text that may be selected
    public static var verticalText: Self { .init("vertical-text") }
    
    /// The cursor indicates that an edge of a box is to be moved left (west)
    public static var wResize: Self { .init("w-resize") }
    
    /// The cursor indicates that the program is busy
    public static var wait: Self { .init("wait") }
    
    /// The cursor indicates that something can be zoomed in
    public static var zoomIn: Self { .init("zoom-in") }
    
    /// The cursor indicates that something can be zoomed out
    public static var zoomOut: Self { .init("zoom-out") }
    
    public var description: String { value }
}
