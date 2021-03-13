//
//  Stylesheet.swift
//  CSS
//
//  Created by Mihael Isaev on 29.11.2020.
//

import DOM

open class Stylesheet: BaseElement {
    public typealias Rule = CSSRule
    public typealias RuleItems = Rules.Content
    open override class var name: String { "style" }
    
    lazy var sheet: JSValue = domElement.sheet
    
    public private(set) var _rules: [CSSRule] = []
    
    public convenience init(@Rules content: @escaping Rules.Block) {
        self.init()
        parseRulesItem(content().rulesContent)
        processRules()
    }
    
    @discardableResult
    public func rules(@Rules content: @escaping Rules.Block) -> Self {
        parseRulesItem(content().rulesContent)
        processRules()
        return self
    }
    
    public override func postInit() {
        super.postInit()
        parseRulesItem(rules.rulesContent)
    }
    
    @Rules open var rules: RuleItems { _RulesContent(rulesContent: .none) }
    
    private func parseRulesItem(_ item: Rules.Item) {
        switch item {
        case .items(let v): v.forEach { parseRulesItem($0) }
        case .rule(let v): _rules.append(v)
        case .none: break
        }
    }
    
    public func processRules() {
        _rules.enumerated().forEach { i, rule in
            let cssText = rule.render()
            #if !WEBPREVIEW
            guard let index = sheet.insertRule.function?.callAsFunction(this: sheet.object, cssText).number else { return }
            rule.domElement = sheet.rules.item.function?.callAsFunction(this: sheet.rules.object, Int(index))
            #endif
        }
    }
    
    open override func didAddToDOM() {
        super.didAddToDOM()
        disabled(_disabled)
        processRules()
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
    
    public private(set) var _disabled = false
    
    /// Disables stylesheet
    @discardableResult
    public func disabled(_ value: Bool) -> Self {
        #if !WEBPREVIEW
        domElement.disabled = value.jsValue()
        #endif
        _disabled = value
        return self
    }
    
    /// Disables stylesheet
    @discardableResult
    public func disabled<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool {
        disabled(value.stateValue.wrappedValue)
        value.stateValue.listen { self.disabled($0) }
        return self
    }
}
