//
//  PreviewableApp.swift
//  Web
//
//  Created by Mihael Isaev on 31.01.2021.
//

import CSS

public protocol PreviewableApp {
    static var shared: WebApp { get }
    
    @discardableResult
    static func start() -> WebApp
}

protocol _PreviewableApp: _AppStylesheets, PreviewableApp {
    func _previewStart()
}

protocol _AppStylesheets {
    var stylesheets: [Stylesheet] { get }
}
