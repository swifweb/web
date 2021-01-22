//
//  KindAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol KindAttrable {
    @discardableResult
    func kind(_ value: String) -> Self
    @discardableResult
    func kind<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String
}

protocol _KindAttrable: _AnyElement, KindAttrable {}

extension KindAttrable {
    /// Specifies the kind of text track.
    ///
    /// Applicable to `<track>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_kind.asp)
    @discardableResult
    public func kind(_ value: String) -> Self {
        guard let s = self as? _KindAttrable else { return self }
        s.domElement.kind = value.jsValue()
        return self
    }
    
    /// Specifies the kind of text track.
    ///
    /// Applicable to `<track>`
    ///
    /// [More info →](https://www.w3schools.com/tags/att_kind.asp)
    @discardableResult
    public func kind<S>(_ value: S) -> Self where S: StateConvertible, S.Value == String {
        kind(value.stateValue.wrappedValue)
        value.stateValue.listen { self.kind($0) }
        return self
    }
}

extension Track: _KindAttrable {}
