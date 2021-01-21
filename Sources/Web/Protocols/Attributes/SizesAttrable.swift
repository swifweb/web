//
//  SizesAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol SizesAttrable {
    @discardableResult
    func sizes(_ w: Int, _ h: Int) -> Self
}

protocol _SizesAttrable: _AnyElement, SizesAttrable {}

extension SizesAttrable {
    /// The sizes attribute specifies the sizes of icons for visual media.
    ///
    /// This attribute is only used if rel="icon".
    ///
    /// Applicable to <link>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_sizes.asp)
    @discardableResult
    public func sizes(_ w: Int, _ h: Int) -> Self {
        guard let s = self as? _SizesAttrable else { return self }
        s.domElement.sizes = "\(w)x\(h)".jsValue()
        return self
    }
}

extension Link: _SizesAttrable {}
