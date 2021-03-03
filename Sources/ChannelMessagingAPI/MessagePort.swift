//
//  MessagePort.swift
//  ChannelMessagingAPI
//
//  Created by Mihael Isaev on 28.02.2021.
//

import WebFoundation
import Events

/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/MessagePort)
public class MessagePort {
    let jsValue: JSValue
    
    public init (_ jsValue: JSValue) {
        self.jsValue = jsValue
    }
    
    // TODO: implement
}
