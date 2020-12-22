//
//  PreloadType.swift
//  WasmApp
//
//  Created by Mihael Isaev on 22.12.2020.
//

import Foundation

public final class PreloadType {
    public let value: String
    
    public init (_ value: String) {
        self.value = value
    }
    
    /// Indicates that the video should not be preloaded.
    public static var none: PreloadType { .init("none") }
    
    /// Indicates that only video metadata (e.g. length) is fetched.
    public static var metadata: PreloadType { .init("metadata") }
    
    /// Indicates that the whole video file can be downloaded, even if the user is not expected to use it.
    public static var auto: PreloadType { .init("auto") }
}
