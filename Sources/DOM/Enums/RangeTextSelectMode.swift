//
//  RangeTextSelectMode.swift
//  DOM
//
//  Created by Mihael Isaev on 16.01.2021.
//

/// Defining how the selection should be set after the text has been replaced.
public enum RangeTextSelectMode: String {
    /// Selects the newly inserted text
    case select
    /// Moves the selection to just before the inserted text
    case start
    /// Moves the selection to just after the inserted text
    case end
    /// Attempts to preserve the selection. This is the default
    case preserve
}
