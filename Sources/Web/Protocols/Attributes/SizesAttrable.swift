//
//  SizesAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public protocol SizesAttrable {
    @discardableResult
    func sizes(_ w: Int, _ h: Int) -> Self
    func sizes<W>(_ w: W, _ h: Int) -> Self where W: StateConvertible, W.Value == Int
    func sizes<H>(_ w: Int, _ h: H) -> Self where H: StateConvertible, H.Value == Int
    func sizes<W, H>(_ w: W, _ h: H) -> Self where W: StateConvertible, W.Value == Int, H: StateConvertible, H.Value == Int
}

protocol _SizesAttrable: _AnyElement, SizesAttrable {}

extension SizesAttrable {
    /// The sizes attribute specifies the sizes of icons for visual media.
    ///
    /// This attribute is only used if rel="icon".
    ///
    /// Applicable to `<link>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_sizes.asp)
    @discardableResult
    public func sizes(_ w: Int, _ h: Int) -> Self {
        guard let s = self as? _SizesAttrable else { return self }
        s.setAttribute("sizes", "\(w)x\(h)")
        return self
    }
    
    /// The sizes attribute specifies the sizes of icons for visual media.
    ///
    /// This attribute is only used if rel="icon".
    ///
    /// Applicable to `<link>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_sizes.asp)
    @discardableResult
    public func sizes<W>(_ w: W, _ h: Int) -> Self where W: StateConvertible, W.Value == Int {
        sizes(w.stateValue.wrappedValue, h)
        w.stateValue.listen { self.sizes($0, h) }
        return self
    }
    
    /// The sizes attribute specifies the sizes of icons for visual media.
    ///
    /// This attribute is only used if rel="icon".
    ///
    /// Applicable to `<link>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_sizes.asp)
    @discardableResult
    public func sizes<H>(_ w: Int, _ h: H) -> Self where H: StateConvertible, H.Value == Int {
        sizes(w, h.stateValue.wrappedValue)
        h.stateValue.listen { self.sizes(w, $0) }
        return self
    }
    
    /// The sizes attribute specifies the sizes of icons for visual media.
    ///
    /// This attribute is only used if rel="icon".
    ///
    /// Applicable to `<link>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_sizes.asp)
    @discardableResult
    public func sizes<W, H>(_ w: W, _ h: H) -> Self where W: StateConvertible, W.Value == Int, H: StateConvertible, H.Value == Int {
        sizes(w.stateValue.wrappedValue, h.stateValue.wrappedValue)
        w.stateValue.and(h.stateValue).listen { self.sizes($0.left, $0.right) }
        return self
    }
}

extension Link: _SizesAttrable {}
