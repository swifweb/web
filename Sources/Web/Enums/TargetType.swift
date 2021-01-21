//
//  TargetType.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

/// A keyword or author-defined name of the default browsing context
/// to show the results of navigation from <a>, <area>,
/// or <form> elements without explicit target attributes.
public enum TargetType: String {
    /// Show the result in the current browsing context.
    /// **Default**
    case `self` = "_self"
    
    /// Show the result in a new, unnamed browsing context.
    case blank = "_blank"
    
    /// Show the result in the parent browsing context of the current one,
    /// if the current page is inside a frame. If there is no parent, acts the same as _self.
    case parent = "_parent"
    
    /// Show the result in the topmost browsing context
    /// (the browsing context that is an ancestor of the current one and has no parent).
    /// If there is no parent, acts the same as _self.
    case top = "_top"
}
