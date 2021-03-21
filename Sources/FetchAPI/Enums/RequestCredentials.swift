//
//  RequestCredentials.swift
//  FetchAPI
//
//  Created by Mihael Isaev on 19.03.2021.
//

public enum RequestCredentials: String {
    case omit
    case sameOrigin = "same-origin"
    case include
}
