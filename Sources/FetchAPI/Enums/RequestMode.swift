//
//  RequestMode.swift
//  FetchAPI
//
//  Created by Mihael Isaev on 19.03.2021.
//

public enum RequestMode: String {
    case cors
    case noCors = "no-cors"
    case sameOrigin = "same-origin"
    case navigate
}
