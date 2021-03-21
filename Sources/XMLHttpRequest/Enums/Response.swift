//
//  Response.swift
//  XMLHttpRequest
//
//  Created by Mihael Isaev on 21.03.2021.
//

import WebFoundation

public enum Response {
    case arrayBuffer(ArrayBuffer)
    case blob(Blob)
    case document(JSValue)
    case text(String)
    case json(JSValue)
}
