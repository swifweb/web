//
//  Document.swift
//  
//
//  Created by Mihael Isaev on 16.11.2020.
//

import Foundation
import JavaScriptKit

public class Document: AnyElement {
    public static var name: String { "\(Self.self)".lowercased() }
    
    public let window: Window
    
    let domElement = JSObject.global.document
    
    var scripts: [(Script, JSValue)] = []
    
    @State public var title = ""
    @State public internal(set) var isVisible = false
    @State public internal(set) var isInForeground = false
    @State public internal(set) var isActive = false
    
    lazy var titleElement = Title(in: self)
    
    public lazy var head = Head(domElement: domElement.head)
    public lazy var body = Body(domElement: domElement.body)
    
    func createElement(_ name: String) -> JSValue {
        domElement.createElement(name)
    }
    
    init (_ window: Window) {
        self.window = window
        setupTitle()
        window.$isInForeground.merge(with: $isInForeground)
        window.$isActive.merge(with: $isActive)
        $isVisible.listen { old, new in
            guard old != new else { return }
            self.isInForeground = new
        }
    }
    
    private func setupTitle() {
        head.appendChild(titleElement)
        $title.listen {old, new in
            guard old != new else { return }
            Dispatch.async {
                self.titleElement.value = new
            }
        }
    }
    
    func updateVisibility() {
        isVisible = domElement.visibilityState.string == "visible"
    }
    
//    func append(_ script: Script) {
//        guard script.code.count > 0 else { return }
//        var scriptElement = domElement.createElement("script")
//        #if DEBUG
//        scriptElement.innerText = script.code.jsValue()
//        #else
//        guard let base64Code = script.code.data(using: .utf8)?.base64EncodedString() else { return }
//        let code = "data:text/javascript;base64," + base64Code
//        scriptElement.src = code.jsValue()
//        #endif
//        scripts.append((script, domElement.head.appendChild(scriptElement)))
//        script.addedToDocument()
//    }
}
