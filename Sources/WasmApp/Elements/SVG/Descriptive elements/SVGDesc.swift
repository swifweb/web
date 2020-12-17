//
//  SVGDesc.swift
//  WasmApp
//
//  Created by Mihael Isaev on 16.12.2020.
//

import Foundation

/// The <desc> element provides an accessible, long-text description of any SVG container element or graphics element.
///
/// Text in a <desc> element is not rendered as part of the graphic.
/// If the element can be described by visible text, it is possible to reference that text
/// with the aria-describedby attribute. If aria-describedby is used, it will take precedence over <desc>.
///
/// The hidden text of a <desc> element can also be concatenated with the visible text
/// of other elements using multiple IDs in an aria-describedby value.
/// In that case, the <desc> element must provide an ID for reference.
/// 
/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/desc
open class SVGDesc: BaseActiveElement {
    
}
