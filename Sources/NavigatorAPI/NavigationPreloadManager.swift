//
//  NavigationPreloadManager.swift
//  NavigatorAPI
//
//  Created by Mihael Isaev on 01.03.2021.
//

import WebFoundation

/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/NavigationPreloadManager)
public class NavigationPreloadManager {
    let jsValue: JSValue
    
    init (_ value: JSValue) {
        jsValue = value
    }
}
