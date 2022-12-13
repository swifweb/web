//
//  ARIAProperties.swift
//  
//
//  Created by Mihael Isaev on 04.12.2022.
//

import WebFoundation

//// MARK: - RoleAttrable
//
//public protocol RoleAttrable: DOMElement {
//    @discardableResult
//    func role(_ value: Bool) -> Self
//    @discardableResult
//    func role<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool
//}
//
//extension RoleAttrable {
//    /// ARIA roles provide semantic meaning to content, allowing screen readers and other tools
//    /// to present and support interaction with object in a way that is consistent
//    /// with user expectations of that type of object. ARIA roles can be used to describe elements
//    /// that don't natively exist in HTML or exist but don't yet have full browser support.
//    ///
//    /// Applicable to `<button>`, `<fieldset>`, `<input>`, `<keygen>`,
//    /// `<optgroup>`, `<option>`, `<select>`, `<textarea>`, `<style>`
//    ///
//    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Roles)
//    @discardableResult
//    public func role(_ value: Bool) -> Self {
//        setter.setAttribute("role", value, .short)
//        return self
//    }
//
//    /// Indicates whether the user can interact with the element.
//    ///
//    /// Applicable to `<button>`, `<fieldset>`, `<input>`, `<keygen>`,
//    /// `<optgroup>`, `<option>`, `<select>`, `<textarea>`, `<style>`
//    ///
//    /// [More info →](https://developer.mozilla.org/en-US/docs/Web/HTML/Attributes/disabled)
//    @discardableResult
//    public func role<S>(_ value: S) -> Self where S: StateConvertible, S.Value == Bool {
//        disabled(value.stateValue.wrappedValue)
////        value.stateValue.listen { self.disabled($0) }
//        return self
//    }
//}
//
//extension A: RoleAttrable {}

/// [More info →](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Attributes/aria-activedescendant)
//aria-activedescendant
/// [More info →](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Attributes/aria-atomic)
//aria-atomic
/// [More info →](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Attributes/aria-autocomplete)
//aria-autocomplete
/// [More info →](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Attributes/aria-braillelabel)
//aria-braillelabel
/// [More info →](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Attributes/aria-brailleroledescription)
//aria-brailleroledescription
/// [More info →](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Attributes/aria-busy)
//aria-busy
/// [More info →](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Attributes/aria-checked)
//aria-checked
/// [More info →](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Attributes/aria-colcount)
//aria-colcount
/// [More info →](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Attributes/aria-colindex)
//aria-colindex
/// [More info →](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Attributes/aria-colindextext)
//aria-colindextext
/// [More info →](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Attributes/aria-colspan)
//aria-colspan
/// [More info →](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Attributes/aria-controls)
//aria-controls
/// [More info →](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Attributes/aria-current)
//aria-current
/// [More info →](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Attributes/aria-describedby)
//aria-describedby
/// [More info →](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Attributes/aria-description)
//aria-description
/// [More info →](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Attributes/aria-details)
//aria-details
/// [More info →](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Attributes/aria-disabled)
//aria-disabled
/// [More info →](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Attributes/aria-errormessage)
//aria-errormessage
/// [More info →](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Attributes/aria-expanded)
//aria-expanded
/// [More info →](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Attributes/aria-flowto)
//aria-flowto
/// [More info →](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Attributes/aria-haspopup)
//aria-haspopup
/// [More info →](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Attributes/aria-hidden)
//aria-hidden
/// [More info →](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Attributes/aria-invalid)
//aria-invalid
/// [More info →](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Attributes/aria-keyshortcuts)
//aria-keyshortcuts
/// [More info →](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Attributes/aria-label)
//aria-label
/// [More info →](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Attributes/aria-labelledby)
//aria-labelledby
/// [More info →](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Attributes/aria-level)
//aria-level
/// [More info →](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Attributes/aria-live)
//aria-live
/// [More info →](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Attributes/aria-modal)
//aria-modal
/// [More info →](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Attributes/aria-multiline)
//aria-multiline
/// [More info →](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Attributes/aria-multiselectable)
//aria-multiselectable
/// [More info →](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Attributes/aria-orientation)
//aria-orientation
/// [More info →](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Attributes/aria-owns)
//aria-owns
/// [More info →](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Attributes/aria-placeholder)
//aria-placeholder
/// [More info →](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Attributes/aria-posinset)
//aria-posinset
/// [More info →](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Attributes/aria-pressed)
//aria-pressed
/// [More info →](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Attributes/aria-readonly)
//aria-readonly
/// [More info →](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Attributes/aria-relevant)
//aria-relevant
/// [More info →](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Attributes/aria-required)
//aria-required
/// [More info →](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Attributes/aria-roledescription)
//aria-roledescription
/// [More info →](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Attributes/aria-rowcount)
//aria-rowcount
/// [More info →](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Attributes/aria-rowindex)
//aria-rowindex
/// [More info →](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Attributes/aria-rowindextext)
//aria-rowindextext
/// [More info →](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Attributes/aria-rowspan)
//aria-rowspan
/// [More info →](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Attributes/aria-selected)
//aria-selected
/// [More info →](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Attributes/aria-setsize)
//aria-setsize
/// [More info →](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Attributes/aria-sort)
//aria-sort
/// [More info →](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Attributes/aria-valuemax)
//aria-valuemax
/// [More info →](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Attributes/aria-valuemin)
//aria-valuemin
/// [More info →](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Attributes/aria-valuenow)
//aria-valuenow
/// [More info →](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA/Attributes/aria-valuetext)
//aria-valuetext
