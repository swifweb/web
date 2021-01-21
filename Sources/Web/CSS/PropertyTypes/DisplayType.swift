//
//  DisplayType.swift
//  Web
//
//  Created by Mihael Isaev on 10.07.2020.
//

public struct DisplayType: Noneable, Initialable, Inheritable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// Displays an element as an inline element (like <span>). Any height and width properties will have no effect
    public static var inline: Self { .init("inline") }
    
    /// Displays an element as a block element (like <p>). It starts on a new line, and takes up the whole width
    public static var block: Self { .init("block") }
    
    /// Makes the container disappear, making the child elements children of the element the next level up in the DOM
    public static var contents: Self { .init("contents") }
    
    /// Displays an element as a block-level flex container
    public static var flex: Self { .init("flex") }
    
    /// Displays an element as a block-level grid container
    public static var grid: Self { .init("grid") }
    
    /// Displays an element as an inline-level block container. The element itself is formatted as an inline element, but you can apply height and width values
    public static var inlineBlock: Self { .init("inline-block") }
    
    /// Displays an element as an inline-level flex container
    public static var inlineFlex: Self { .init("inline-flex") }
    
    /// Displays an element as an inline-level grid container
    public static var inlineGrid: Self { .init("inline-grid") }
    
    /// The element is displayed as an inline-level table
    public static var inlineTable: Self { .init("inline-table") }
    
    /// Let the element behave like a <li> element
    public static var listItem: Self { .init("list-item") }
    
    /// Displays an element as either block or inline, depending on context
    public static var runIn: Self { .init("run-in") }
    
    /// Let the element behave like a <table> element
    public static var table: Self { .init("table") }
    
    /// Let the element behave like a <caption> element
    public static var tableCaption: Self { .init("table-caption") }
    
    /// Let the element behave like a <colgroup> element
    public static var tableColumnGroup: Self { .init("table-column-group") }
    
    /// Let the element behave like a <thead> element
    public static var tableHeaderGroup: Self { .init("table-header-group") }
    
    /// Let the element behave like a <tfoot> element
    public static var tableFooterGroup: Self { .init("table-footer-group") }
    
    /// Let the element behave like a <tbody> element
    public static var tableRowGroup: Self { .init("table-row-group") }
    
    /// Let the element behave like a <td> element
    public static var tableCell: Self { .init("table-cell") }
    
    /// Let the element behave like a <col> element
    public static var tableColumn: Self { .init("table-column") }
    
    /// Let the element behave like a <tr> element
    public static var tableRow: Self { .init("table-row") }
    
    public var description: String { value }
}
