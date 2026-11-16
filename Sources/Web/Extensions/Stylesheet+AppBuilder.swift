//
//  File.swift
//  
//
//  Created by Mihael Isaev on 26.02.2021.
//

import CSS

extension Stylesheet: AppBuilderContent {
    @MainActor public var appBuilderContent: AppBuilder.Item { .stylesheet(self) }
}
