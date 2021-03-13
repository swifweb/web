//
//  DOMEventable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 24.02.2021.
//

public protocol DOMEventable: Storageable {
    #if arch(wasm32)
    var domElement: JSValue { get set }
    #endif
}

extension DOMEventable {
    func setDOMHandlerIfNeeded(_ key: String, _ container: AnyContainer) -> Self {
        #if arch(wasm32)
        guard !container.isAddedToDOM else { return self }
        domElement[dynamicMember: key] = container.closure.jsValue()
        container.isAddedToDOM = true
        #endif
        return self
    }
    
    func callFunction(_ name: String, this: Bool = true, args: WebJSValue...) {
        #if arch(wasm32)
        if this {
            domElement[dynamicMember: name].function?.callAsFunction(this: domElement.object, arguments: args.map { $0.webValue })
        } else {
            // TODO: implement global function calling?
//            domElement[dynamicMember: name].function?.callAsFunction(arguments: args.map { $0.webValue })
        }
        #endif
    }
}
