//
//  CrossOriginType.swift
//  WasmApp
//
//  Created by Mihael Isaev on 20.12.2020.
//

import Foundation

/// The crossorigin attribute, valid on the <audio>, <img>, <link>, <script>, and <video> elements,
/// provides support for CORS, defining how the element handles crossorigin requests,
/// thereby enabling the configuration of the CORS requests for the element's fetched data.
/// Depending on the element, the attribute can be a CORS settings attribute.
public final class CrossOriginType {
    public let value: String
    
    public init (_ value: String) {
        self.value = value
    }
    
    /// CORS requests for this element will have the credentials flag set to 'same-origin'.
    public static var anonymous: CrossOriginType { .init("anonymous") }
    
    /// CORS requests for this element will have the credentials flag set to 'include'.
    public static var useCredentials: CrossOriginType { .init("use-credentials") }
}
