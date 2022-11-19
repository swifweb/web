//
//  BlobPropertyBag.swift
//  WebFoundation
//
//  Created by Mihael Isaev on 20.03.2021.
//

import JavaScriptKit

public struct BlobPropertyBag: ConvertibleToJSValue {
	/// The MIME type of the data that will be stored into the blob.
    ///
    /// The default value is the empty string, ("").
    let type: String
    
    /// How to interpret newline characters (\n) within the contents, if the data is text.
    ///
    /// The default value, transparent, copies newline characters into the blob without changing them.
    ///
    /// To convert newlines to the host system's native convention, specify the value native.
    let endings: String?
    
    public init (type: String = "", endings: String? = nil) {
        self.type = type
        self.endings = endings
    }
    
	public var jsValue: JSValue {
		var result: [String: ConvertibleToJSValue] = [:]
		result["type"] = type
		if let endings = endings {
			result["endings"] = endings
		}
		return result.jsValue
	}
}
