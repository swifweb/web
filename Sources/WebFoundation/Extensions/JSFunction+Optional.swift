//
//  JSFunction+Optional.swift
//  WebFoundation
//
//  Created by Mihael Isaev on 17.11.2022.
//

import JavaScriptKit

extension JSFunction {
	/// Call this function with given `arguments` and binding given `this` as context.
	/// - Parameters:
	///   - this: The value to be passed as the `this` parameter to this function.
	///   - arguments: Arguments to be passed to this function.
	/// - Returns: The result of this call.
	@discardableResult
	public func callAsFunction(optionalThis this: JSObject?, arguments: [ConvertibleToJSValue]) -> JSValue? {
		guard let this = this else { return nil }
		return callAsFunction(this: this, arguments: arguments)
	}

	/// A variadic arguments version of `callAsFunction`.
	@discardableResult
	public func callAsFunction(optionalThis this: JSObject?, _ arguments: ConvertibleToJSValue...) -> JSValue? {
		callAsFunction(optionalThis: this, arguments: arguments)
	}
}
