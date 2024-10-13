//
//  Splash.swift
//  Web
//
//  Created by Mihael Isaev on 28.02.2024.
//

import Foundation

open class Splash: Div, AppBuilderContent {
    public var appBuilderContent: AppBuilder.Item { .splash(self) }
    
    open override class var name: String { "div" }
    
    var pathToHTML: String?
    
    public required init() {
        super.init()
        self.id("splash")
    }
    
    public init(pathToHTML: String) {
        self.pathToHTML = pathToHTML
        super.init()
        self.id("splash")
    }
}
