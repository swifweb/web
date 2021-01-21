//
//  EncTypeAttrable.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation
import JavaScriptKit

public protocol EncTypeAttrable {
    @discardableResult
    func encType(_ value: EncType) -> Self
    @discardableResult
    func encType(_ value: State<EncType>) -> Self
    @discardableResult
    func encType<V>(_ expressable: ExpressableState<V, EncType>) -> Self
}

protocol _EncTypeAttrable: _AnyElement, EncTypeAttrable {}

extension EncTypeAttrable {
    /// Defines the content type of the form data when the method is POST.
    ///
    /// Applicable to <form>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_form_enctype.asp)
    @discardableResult
    public func encType(_ value: EncType) -> Self {
        guard let s = self as? _EncTypeAttrable else { return self }
        s.domElement.enctype = value.value.jsValue()
        return self
    }
    
    /// Defines the content type of the form data when the method is POST.
    ///
    /// Applicable to <form>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_form_enctype.asp)
    @discardableResult
    public func encType(_ value: State<EncType>) -> Self {
        value.listen { self.encType($0) }
        return self
    }
    
    /// Defines the content type of the form data when the method is POST.
    ///
    /// Applicable to <form>
    ///
    /// [More info →](https://www.w3schools.com/tags/att_form_enctype.asp)
    @discardableResult
    public func encType<V>(_ expressable: ExpressableState<V, EncType>) -> Self {
        encType(expressable.unwrap())
    }
}

extension Form: _EncTypeAttrable {}
