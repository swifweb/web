//
//  WorkerNavigator.swift
//  WorkersAPI
//
//  Created by Mihael Isaev on 01.03.2021.
//

import WebFoundation

public struct WorkerNavigator {
    let jsValue: JSValue
    
    /// Returns the code name of the browser
    public let appCodeName: String
    
    /// Returns the name of the browser
    public let appName: String
    
    /// Returns the version information of the browser
    public let appVersion: String
    
    /// Returns the number of logical processor cores available.
    public let hardwareConcurrency: Int
    
    /// Returns the language of the browser
    public let language: String?
    
    /// Returns an array of  the languages known to the user, in order of preference.
    public let languages: [String]
    
    /// Determines whether the browser is online
    public var onLine: Bool { jsValue.onLine.boolean ?? false }
    
    /// Returns for which platform the browser is compiled
    public let platform: String
    
    /// Returns the engine name of the browser
    public let product: String
    
    /// Returns the user-agent header sent by the browser to the server
    public let userAgent: String
    
    public init (_ value: JSValue) {
        jsValue = value
        appCodeName = value.appCodeName.string ?? ""
        appName = value.appName.string ?? ""
        appVersion = value.appVersion.string ?? ""
        hardwareConcurrency = Int(value.hardwareConcurrency.number ?? 0)
        language = value.language.string
        languages = value.languages.array?.compactMap { $0.string } ?? []
        platform = value.platform.string ?? ""
        product = value.product.string ?? ""
        userAgent = value.userAgent.string ?? ""
    }
}
