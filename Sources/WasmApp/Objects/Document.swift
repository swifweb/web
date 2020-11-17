//
//  Document.swift
//  
//
//  Created by Mihael Isaev on 16.11.2020.
//

import Foundation
import JavaScriptKit

public class Document {
    public let window: Window
    
    let domElement = JSObject.global.document
    
    @State public var title = ""
    @State public internal(set) var isVisible = false
    @State public internal(set) var isInForeground = false
    @State public internal(set) var isActive = false
    
    lazy var titleElement = domElement.createElement("title")
    
    init (_ window: Window) {
        self.window = window
        setupTitle()
        $isVisible.listen { old, new in
            guard old != new else { return }
            self.isInForeground = new
        }
    }
    
    private func setupTitle() {
        _ = domElement.head.appendChild(titleElement)
        $title.listen {old, new in
            guard old != new else { return }
            Dispatch.async {
                self.titleElement.innerText = new.jsValue()
            }
        }
        window.$isInForeground.merge(with: $isInForeground)
        window.$isActive.merge(with: $isActive)
    }
    
    func updateVisibility() {
        isVisible = domElement.visibilityState.string == "visible"
    }
}
