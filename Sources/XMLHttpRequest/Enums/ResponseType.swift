//
//  ResponseType.swift
//  XMLHttpRequest
//
//  Created by Mihael Isaev on 21.03.2021.
//

public enum ResponseType: String {
    /// An empty responseType string is treated the same as "text", the default type.
    case `default` = ""
    
    /// The response is a JavaScript ArrayBuffer containing binary data.
    case arrayBuffer = "arraybuffer"
    
    /// The response is a Blob object containing the binary data.
    case blob
    
    /// The response is an HTML Document or XML XMLDocument, as appropriate based on the MIME type of the received data. See HTML in XMLHttpRequest to learn more about using XHR to fetch HTML content.
    case document
    
    /// The response is a JavaScript object created by parsing the contents of received data as JSON.
    case json
    
    /// The response is a text in a DOMString object.
    case text = "text"
}
