//
//  ScopeType.swift
//  DOM
//
//  Created by Mihael Isaev on 22.12.2020.
//

import Foundation

public final class ScopeType {
    public let value: String
    
    public init (_ value: String) {
        self.value = value
    }
    
    /// The header relates to all cells of the row it belongs to.
    public static var row: ScopeType { .init("row") }
    
    /// The header relates to all cells of the column it belongs to.
    public static var col: ScopeType { .init("col") }
    
    /// The header belongs to a rowgroup and relates to all of its cells.
    /// These cells can be placed to the right or the left of the header,
    /// depending on the value of the dir attribute in the <table> element.
    public static var rowgroup: ScopeType { .init("rowgroup") }
    
    /// The header belongs to a colgroup and relates to all of its cells.
    public static var colgroup: ScopeType { .init("colgroup") }
    
    /// Default.
    public static var auto: ScopeType { .init("auto") }
}
