//
//  FormData+DOMElement.swift
//  Web
//
//  Created by Mihael Isaev on 19.03.2021.
//

import DOM
import FetchAPI

extension FormData {
    /// An HTML `<form>` element — the FormData object will be populated with the form's current keys/values
    /// using the name property of each element for the keys and their submitted value for the values.
    ///
    /// It will also encode file input content.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/FormData/FormData)
    public convenience init (_ form: Form) {
        self.init(form.domElement)
    }
}
