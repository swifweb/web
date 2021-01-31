//
//  BaseElement.swift
//  Web
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation
import JavaScriptKit

open class BaseElement: _AnyElement, BodyBuilderContent, _AnimationEndHandleable, _AnimationIterationHandleable, _AnimationStartHandleable, _ContextMenuHandleable, _CopyHandleable, _CutHandleable, _DragHandleable, _DragEndHandleable, _DragEnterHandleable, _DragLeaveHandleable, _DragOverHandleable, _DragStartHandleable, _DropHandleable, _FullScreenChangeHandleable, _FullScreenErrorHandleable, _MessageHandleable, _OpenHandleable, _PasteHandleable, _TouchCancelHandleable, _TouchEndHandleable, _TouchMoveHandleable, _TouchStartHandleable, _TransitionEndHandleable, _WheelHandleable, StaticPointerable, _CSSRulable {
    public var pointer: Pointer { .init(Self.name) }
    
    public class var name: String { "\(Self.self)".lowercased() }
    
    public var bodyBuilderContent: BodyBuilderItem { .elements([self]) }
    
    let uid: String = .shuffledAlphabet(8, letters: "AaBbCcDdEeFfGgJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz0123456789=")
    lazy var _id = uid
    lazy var _classes: Set<String> = []

    var subElements: [_AnyElement] = []
    #if !arch(wasm32)
    var styles: [String: String] = [:]
    var attributes: [String: String] = [:]
    #endif
    
    var rootElement: JSValue?
    var domElement: JSValue
    
    required public init () {
        domElement = WebApp.shared.document.createElement(Self.name)
        postInit()
    }
    
    public init (in document: Document) {
        domElement = document.createElement(Self.name)
        postInit()
    }
    
    public init (domElement: JSValue) {
        self.domElement = domElement
        postInit()
    }
    
    func postInit() {
        #if arch(wasm32)
        domElement.id = uid.jsValue()
        #endif
    }
    
    func didAddToDOM() {}
    
    func didRemoveFromDOM() {}
    
    var animationEndClosure: AnimationEndClosure?
    var animationEndHandler: (AnimationEvent) -> Void = { _ in }
    
    var animationIterationClosure: AnimationIterationClosure?
    var animationIterationHandler: (AnimationEvent) -> Void = { _ in }
    
    var animationStartClosure: AnimationStartClosure?
    var animationStartHandler: (AnimationEvent) -> Void = { _ in }
    
    var contextMenuClosure: ContextMenuClosure?
    var contextMenuHandler: (MouseEvent) -> Void = { _ in }
    
    var copyClosure: CopyClosure?
    var copyHandler: (ClipboardEvent) -> Void = { _ in }
    
    var cutClosure: CutClosure?
    var cutHandler: (ClipboardEvent) -> Void = { _ in }
    
    var dragClosure: DragClosure?
    var dragHandler: (DragEvent) -> Void = { _ in }
    
    var dragEndClosure: DragEndClosure?
    var dragEndHandler: (DragEvent) -> Void = { _ in }
    
    var dragEnterClosure: DragEnterClosure?
    var dragEnterHandler: (DragEvent) -> Void = { _ in }
    
    var dragLeaveClosure: DragLeaveClosure?
    var dragLeaveHandler: (DragEvent) -> Void = { _ in }
    
    var dragOverClosure: DragOverClosure?
    var dragOverHandler: (DragEvent) -> Void = { _ in }
    
    var dragStartClosure: DragStartClosure?
    var dragStartHandler: (DragEvent) -> Void = { _ in }
    
    var dropClosure: DropClosure?
    var dropHandler: (DragEvent) -> Void = { _ in }
    
    var fullScreenChangeClosure: FullScreenChangeClosure?
    var fullScreenChangeHandler: (HandledEvent) -> Void = { _ in }
    
    var fullScreenErrorClosure: FullScreenErrorClosure?
    var fullScreenErrorHandler: (HandledEvent) -> Void = { _ in }
    
    var messageClosure: MessageClosure?
    var messageHandler: (HandledEvent) -> Void = { _ in }
    
    var openClosure: OpenClosure?
    var openHandler: (HandledEvent) -> Void = { _ in }
    
    var pasteClosure: PasteClosure?
    var pasteHandler: (ClipboardEvent) -> Void = { _ in }
    
    var touchCancelClosure: TouchCancelClosure?
    var touchCancelHandler: (TouchEvent) -> Void = { _ in }
    
    var touchEndClosure: TouchEndClosure?
    var touchEndHandler: (TouchEvent) -> Void = { _ in }
    
    var touchMoveClosure: TouchMoveClosure?
    var touchMoveHandler: (TouchEvent) -> Void = { _ in }
    
    var touchStartClosure: TouchStartClosure?
    var touchStartHandler: (TouchEvent) -> Void = { _ in }
    
    var transitionEndClosure: TransitionEndClosure?
    var transitionEndHandler: (TransitionEvent) -> Void = { _ in }
    
    var wheelClosure: WheelClosure?
    var wheelHandler: (WheelEvent) -> Void = { _ in }
    
    deinit {
        animationEndClosure?.release()
        animationIterationClosure?.release()
        animationStartClosure?.release()
        contextMenuClosure?.release()
        copyClosure?.release()
        cutClosure?.release()
        dragClosure?.release()
        dragEndClosure?.release()
        dragEnterClosure?.release()
        dragLeaveClosure?.release()
        dragOverClosure?.release()
        dragStartClosure?.release()
        dropClosure?.release()
        fullScreenChangeClosure?.release()
        fullScreenErrorClosure?.release()
        messageClosure?.release()
        openClosure?.release()
        pasteClosure?.release()
        touchCancelClosure?.release()
        touchEndClosure?.release()
        touchMoveClosure?.release()
        touchStartClosure?.release()
        transitionEndClosure?.release()
        wheelClosure?.release()
    }
    
    func removeFromSuperview() {
        #if arch(wasm32)
        guard let rootElement = rootElement else { return }
        rootElement.removeChild.function?.callAsFunction(this: rootElement.object, domElement)
        self.rootElement = nil
        #else
        
        #endif
    }
    
    // MARK: _CSSRulable
    
    func _removeProperty(_ key: String) {
        #if arch(wasm32)
        domElement.style.object?[key] = .null
        #else
        switch previewMode {
        case .static:
            styles.removeValue(forKey: key)
        case .dynamic:
            previewLiveView.executeJS("""
            document.getElementById('\(uid)').style.\(key) = null;
            """)
        }
        #endif
    }
    
    func _setProperty(_ key: String, _ value: String) {
        #if arch(wasm32)
        domElement.style.object?[key] = value.jsValue()
        #else
        switch previewMode {
        case .static:
            styles[key] = value
        case .dynamic:
            previewLiveView.executeJS("""
            document.getElementById('\(uid)').style.\(key) = '\(value)';
            """)
        }
        #endif
    }
}
