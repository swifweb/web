//
//  CaptureType.swift
//  DOM
//
//  Created by Mihael Isaev on 20.12.2020.
//

import Foundation

/// The capture attribute specifies that, optionally, a new file should be captured,
/// and which device should be used to capture that new media of a type defined
/// by the accept attribute. Values include user and environment.
/// The capture attribute is supported on the file input type.
public final class CaptureType {
    public let value: String
    
    public init (_ value: String) {
        self.value = value
    }
    
    /// The user-facing camera and/or microphone should be used.
    public static var user: CaptureType { .init("user") }
    
    /// The outward-facing camera and/or microphone should be used
    public static var environment: CaptureType { .init("environment") }
}
