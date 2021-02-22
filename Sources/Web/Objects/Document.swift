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
    
    let domElement: JSValue
    
    var scripts: [(Script, JSValue)] = []
    
    @State public var title = ""
    @State public var metaDescription = ""
    @State public internal(set) var isVisible = false
    @State public internal(set) var isInForeground = false
    @State public internal(set) var isActive = false
    
    lazy var titleElement = Title(in: self)
    lazy var metaDescriptionElement = Meta(in: self)
    
    #if arch(wasm32)
    public lazy var head = Head(domElement: domElement.head)
    public lazy var body = Body(domElement: domElement.body)
    #else
    public lazy var head = Head(domElement: JSValue(""))
    public lazy var body = Body(domElement: JSValue(""))
    #endif
    
    func createElement(_ name: String) -> JSValue {
        #if arch(wasm32)
        return domElement.createElement(name)
        #else
        return JSValue.init(stringLiteral: "")
        #endif
    }
    
    init (_ window: Window) {
        #if arch(wasm32)
        domElement = JSObject.global.document
        // reset body
        domElement.body.object?.innerHTML = "";
        #else
        domElement = JSValue("")
        #endif
        self.window = window
        setupTitle()
        setupMetaDescription()
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
    
    private func setupMetaDescription() {
        // remove already existing metaDescription node
        var predefinedMetaDescription = ""
        if let existingMetaDescription = domElement.querySelector.function?.callAsFunction(this: domElement.object, "meta[name=\"description\"]"),
           !existingMetaDescription.isNull,
           !existingMetaDescription.isUndefined {
            predefinedMetaDescription = existingMetaDescription.content.string ?? ""
            head.domElement.removeChild.function?.callAsFunction(this: head.domElement.object, existingMetaDescription)
        }
        // set same content in the new metaDescription node
        metaDescriptionElement.name = "description"
        metaDescriptionElement.content = predefinedMetaDescription
        head.appendChild(metaDescriptionElement)
        $metaDescription.listen { old, new in
            guard old != new else { return }
            Dispatch.async {
                self.metaDescriptionElement.content = new
            }
        }
    }
    
    func updateVisibility() {
        #if arch(wasm32)
        isVisible = domElement.visibilityState.string == "visible"
        #endif
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
