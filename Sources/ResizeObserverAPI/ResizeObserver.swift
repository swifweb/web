//
//  ResizeObserver.swift
//  
//
//  Created by Mihael Isaev on 13.12.2022.
//

import WebFoundation
import DOM

/// Reports changes to the dimensions of an Element's content
/// or border box, or the bounding box of an SVGElement.
/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/ResizeObserver/ResizeObserver)
public class ResizeObserver {
    private var closure: JSClosure?
    private var jsValue: JSValue?
    
    public typealias Handler = ([Entry], ResizeObserver) -> Void
    
    private var observers: [BaseElement: Handler] = [:]
    private var positionChangeListenerSubscriptions: [BaseElement] = []
    
    /// Creates and returns a new ResizeObserver object.
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/ResizeObserver/ResizeObserver)
    @discardableResult
    public init (_ callback: @escaping Handler) {
        closure = .init { [weak self] (args: [JSValue]) -> JSValue in
            guard let self = self else { return .undefined }
            guard args.count == 2 else { return .undefined }
            let entries = args.first?.array?.compactMap { Entry($0) } ?? []
            callback(entries, self)
            self.observers.values.forEach { $0(entries, self) }
            return .undefined
        }
        jsValue = JSObject.global.ResizeObserver.function?.new(closure).jsValue ?? .undefined
    }
    
    deinit {
        #if JAVASCRIPTKIT_WITHOUT_WEAKREFS
        closure?.release()
        #endif
    }
    
    public func setObserver(for baseElement: BaseElement, handler: @escaping Handler) {
        if !positionChangeListenerSubscriptions.contains(baseElement) {
            positionChangeListenerSubscriptions.append(baseElement)
            baseElement.properties.positionChangeListeners.append { [weak self] in
                guard let self = self else { return }
//                Console.warning("📏 ResizeObserver: position change event handled")
                self.observers.values.forEach { $0([], self) }
            }
        }
        observers[baseElement] = handler
    }
    
    /// An options object allowing you to set options for the observation.
    public struct ObserverOptions: ConvertibleToJSValue {
        /// Sets which box model the observer will observe changes to.
        public enum BoxType: String {
            /// Size of the content area as defined in CSS.
            case contentBox = "content-box"
            /// Size of the box border area as defined in CSS.
            case borderBox = "border-box"
            /// The size of the content area as defined in CSS, in device pixels,
            /// before applying any CSS transforms on the element or its ancestors.
            case devicePixelContentBox = "device-pixel-content-box"
        }
        /// Sets which box model the observer will observe changes to.
        public var box: BoxType
        
        public var jsValue: JSValue {
            ["box": box.rawValue].jsValue
        }
    }
    
    /// Starts observing the specified Element
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/ResizeObserver/observe)
    @discardableResult
    public func observe<Element: DOMElementable>(_ element: Element, _ options: ObserverOptions? = nil) -> Self {
        #if arch(wasm32)
        jsValue?.object?["observe"].function?.callAsFunction(optionalThis: jsValue?.object, arguments: [element.domElement, options ?? JSValue.null])
        #endif
        return self
    }
    
    /// Ends the observing the specified Element
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/ResizeObserver/unobserve)
    @discardableResult
    public func unobserve<Element: DOMElementable>(_ element: Element) -> Self {
        #if arch(wasm32)
        jsValue?.object?["unobserve"].function?.callAsFunction(optionalThis: jsValue?.object, arguments: [element.domElement])
        #endif
        return self
    }
    
    /// Unobserves all observed Elements
    ///
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/ResizeObserver/disconnect)
    @discardableResult
    public func disconnect() -> Self {
        #if arch(wasm32)
        jsValue?.object?["disconnect"].function?.callAsFunction(optionalThis: jsValue?.object, arguments: [])
        #endif
        return self
    }
    
    /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/ResizeObserverEntry)
    public struct Entry {
        public struct BoxSize: CustomStringConvertible {
            /// The length of the observed element's border box in the block dimension.
            /// For boxes with a horizontal writing-mode, this is the vertical dimension, or height; if the writing-mode is vertical, this is the horizontal dimension, or width.
            public let blockSize: Double
            
            /// The length of the observed element's border box in the inline dimension.
            /// For boxes with a horizontal writing-mode, this is the horizontal dimension, or width;
            /// if the writing-mode is vertical, this is the vertical dimension, or height.
            public let inlineSize: Double
            
            init? (_ jsValue: JSValue) {
                guard let blockSize = jsValue.object?["blockSize"].number else { return nil }
                guard let inlineSize = jsValue.object?["inlineSize"].number else { return nil }
                self.blockSize = blockSize
                self.inlineSize = inlineSize
            }
            
            public var description: String { "BoxSize(blockSize: \(blockSize), inlineSize: \(inlineSize))" }
        }
        
        
        /// An object containing the new border box size of the observed element when the callback is run.
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/ResizeObserverEntry/borderBoxSize)
        public let borderBoxSize: [BoxSize]
        
        /// An object containing the new content box size of the observed element when the callback is run.
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/ResizeObserverEntry/devicePixelContentBoxSize)
        public let contentBoxSize: [BoxSize]
        
        /// An object containing the new content box size in device pixels of the observed element when the callback is run.
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/ResizeObserverEntry/contentRect)
        public let devicePixelContentBoxSize: [BoxSize]
        
        /// A DOMRectReadOnly object containing the new size of the observed element when the callback is run.
        /// Note that this is better supported than the above two properties, but it is left over from an earlier implementation
        /// of the Resize Observer API, is still included in the spec for web compat reasons, and may be deprecated in future versions.
        ///
        /// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/ResizeObserverEntry/target)
        public let contentRect: Rect
        
        /// A reference to the Element or SVGElement being observed.
        public let target: JSValue
        
        init (_ jsValue: JSValue) {
            borderBoxSize = jsValue.object?["borderBoxSize"].array?.compactMap { BoxSize($0) } ?? []
            contentBoxSize = jsValue.object?["contentBoxSize"].array?.compactMap { BoxSize($0) } ?? []
            devicePixelContentBoxSize = jsValue.object?["devicePixelContentBoxSize"].array?.compactMap { BoxSize($0) } ?? []
            if let jsValue = jsValue.object?["contentRect"].jsValue {
                contentRect = .init(jsValue)
            } else {
                contentRect = .zero
            }
            target = jsValue.object?["target"].jsValue ?? .undefined
        }
    }
}
