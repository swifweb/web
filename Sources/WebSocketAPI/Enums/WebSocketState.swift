//
//  WebSocketState.swift
//  WebSocketAPI
//
//  Created by Mihael Isaev on 21.03.2021.
//

public enum WebSocketState: Int {
    case connecting = 0
    case open = 1
    case closing = 2
    case closed = 3
}
