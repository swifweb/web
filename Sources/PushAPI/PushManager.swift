//
//  PushManager.swift
//  PushAPI
//
//  Created by Mihael Isaev on 24.02.2021.
//

import WebFoundation

/// Provides a way to receive notifications from third-party servers as well as request URLs for push notifications.
///
/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/PushManager)
public class PushManager {
    let jsValue: JSValue
    
    public init (_ value: JSValue) {
        jsValue = value
    }
    
    // TODO: implement
}
