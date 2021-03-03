//
//  ContentIndex.swift
//  ContentIndexAPI
//
//  Created by Mihael Isaev on 01.03.2021.
//

import WebFoundation

/// Allows developers to register their offline enabled content with the browser.
///
/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/ContentIndex)
public class ContentIndex {
    let jsValue: JSValue
    
    public init (_ value: JSValue) {
        jsValue = value
    }
    
    // TODO: implement
}
