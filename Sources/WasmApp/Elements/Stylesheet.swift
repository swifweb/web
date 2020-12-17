//
//  Stylesheet.swift
//  WasmApp
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

public class Stylesheet: BaseElement {
    lazy var sheet: JSValue = domElement.sheet
    
    var _rules: [CSSRule] = []
    var rules: [CSSRule] {
        get { _rules }
        set { _rules = newValue }
    }
    
    /// Representing the advisory title of the current style sheet.
    public var title: String {
        get { domElement.title.string ?? "" }
        set { domElement.title = newValue.jsValue() }
    }
    
    /// Deletes the rule at the specified index into the stylesheet's rule list
    func deleteRule() {
        
    }
    
    /// Inserts a new rule at the specified position in the stylesheet, given the textual representation of the rule
    func insertRule() {
        
    }
    
    /// Shows whether the current stylesheet has been applied or not
    public var disabled: Bool {
        get { sheet.disabled.boolean ?? false }
        set { sheet.disabled = newValue.jsValue() }
    }

    /// Representing the location of the stylesheet
    public var href: String? {
        get { sheet.href.string }
    }

    /// Returns a MediaList representing the intended destination medium for style information.
    public var media: String? {
        get { sheet.media.string }
    }

    /// Returns a Node associating this style sheet with the current document.
    var ownerNode: JSValue {
        get { sheet.ownerNode }
    }

    /// Returns a StyleSheet including this one, if any; returns null if there aren't any.
    public var parentStyleSheet: String? {
        get { sheet.parentStyleSheet.string }
    }

    /// Returns a DOMString representing the style sheet language for this style sheet.
    public var type: String? {
        get { sheet.type.string }
    }
}
