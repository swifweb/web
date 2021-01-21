//
//  SVGFEComponentTransfer.swift
//  Web
//
//  Created by Mihael Isaev on 17.12.2020.
//

import Foundation

/// The <feComponentTransfer> SVG filter primitive performs color-component-wise remapping
/// of data for each pixel. It allows operations like brightness adjustment,
/// contrast adjustment, color balance or thresholding.
///
/// The calculations are performed on non-premultiplied color values.
/// The colors are modified by changing each channel (R, G, B, and A) to the result
/// of what the children <feFuncR>, <feFuncB>, <feFuncG>, and <feFuncA> return.
/// 
/// https://developer.mozilla.org/en-US/docs/Web/SVG/Element/feComponentTransfer
open class SVGFEComponentTransfer: BaseActiveElement {
    
}
