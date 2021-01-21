//
//  SVGText.swift
//  Web
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation

/// The SVG <text> element draws a graphics element consisting of text.
/// It's possible to apply a gradient, pattern, clipping path, mask, or filter to <text>, like any other SVG graphics element.
///
/// If text is included in SVG not inside of a <text> element, it is not rendered.
/// This is different than being hidden by default, as setting the display property won't show the text.
///
/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/text
open class SVGText: BaseActiveElement {
    public convenience init (_ text: String) {
        self.init()
        value = text
    }
    
    var value: String {
        get { innerText }
        set { innerText = newValue }
    }
}
