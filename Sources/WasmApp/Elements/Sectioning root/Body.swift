//
//  Body.swift
//  WasmApp
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Foundation

/// The HTML <body> Element represents the content of an HTML document.
/// There can be only one <body> element in a document.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/body)
open class Body: BaseElement, _AfterPrintHandleable, _BeforePrintHandleable, _BeforeUnloadHandleable, _HashChangeHandleable, _OfflineHandleable, _OnlineHandleable, _PageHideHandleable, _PageShowHandleable, _ResizeHandleable, _UnloadHandleable, _ScrollHandleable, _LoadHandleable {
    var afterPrintClosure: AfterPrintClosure?
    var afterPrintHandler: (HandledEvent) -> Void = { _ in }
    
    var beforePrintClosure: BeforePrintClosure?
    var beforePrintHandler: (HandledEvent) -> Void = { _ in }
    
    var beforeUnloadClosure: BeforeUnloadClosure?
    var beforeUnloadHandler: (UIEvent) -> Void = { _ in }
    
    var hashChangeClosure: HashChangeClosure?
    var hashChangeHandler: (HashChangeEvent) -> Void = { _ in }
    
    var offlineClosure: OfflineClosure?
    var offlineHandler: (HandledEvent) -> Void = { _ in }
    
    var onlineClosure: OnlineClosure?
    var onlineHandler: (HandledEvent) -> Void = { _ in }
    
    var pageHideClosure: PageHideClosure?
    var pageHideHandler: (PageTransitionEvent) -> Void = { _ in }
    
    var pageShowClosure: PageShowClosure?
    var pageShowHandler: (PageTransitionEvent) -> Void = { _ in }
    
    var resizeClosure: ResizeClosure?
    var resizeHandler: (UIEvent) -> Void = { _ in }
    
    var unloadClosure: UnloadClosure?
    var unloadHandler: (UIEvent) -> Void = { _ in }
    
    var scrollClosure: ScrollClosure?
    var scrollHandler: (UIEvent) -> Void = { _ in }
    
    var loadClosure: LoadClosure?
    var loadHandler: (UIEvent) -> Void = { _ in }
    
    deinit {
        afterPrintClosure?.release()
        beforePrintClosure?.release()
        beforeUnloadClosure?.release()
        hashChangeClosure?.release()
        offlineClosure?.release()
        onlineClosure?.release()
        pageHideClosure?.release()
        pageShowClosure?.release()
        resizeClosure?.release()
        unloadClosure?.release()
        scrollClosure?.release()
        loadClosure?.release()
    }
}
