//
//  Progress.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public typealias WProgress = Progress

/// The HTML `<progress>` element displays an indicator
/// showing the completion progress of a task, typically displayed as a progress bar.
///
/// The max attribute, if present, must have a value greater than 0
/// and be a valid floating point number. The default value is 1.
///
/// Note: Unlike the `<meter>` element, the minimum value is always 0,
/// and the min attribute is not allowed for the `<progress>` element.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/progress)
open class Progress: BaseActiveElement {
    @State public var value: Double = 0
    @State public var shadowText: String = ""
    
    public required convenience init(_ value: Double, _ shadowText: String? = nil) {
        self.init()
        setAttribute("value", value)
        self.value = value
        _value.listen { [weak self] in
            self?.setAttribute("value", $0)
        }
        let shadowText = shadowText ?? String(value)
        innerText = shadowText
        self.shadowText = shadowText
        _shadowText.listen { [weak self] in
            self?.innerText = $0
        }
    }
    
    public required convenience init(_ value: State<Double>, _ shadowText: State<String>? = nil) {
        self.init(value.wrappedValue, shadowText?.wrappedValue)
        _value.merge(with: value, leftChanged: { [weak self] in
            self?.setAttribute("value", $0)
        }, rightChanged: { [weak self] in
            self?.setAttribute("value", $0)
        })
        if let shadowText = shadowText {
            _shadowText.merge(with: shadowText, leftChanged: { [weak self] in
                self?.innerText = $0
            }, rightChanged: { [weak self] in
                self?.innerText = $0
            })
        }
    }
    
    public required convenience init <V>(_ value: State<Double>, _ shadowText: ExpressableState<V, String>) {
        self.init(value, shadowText.unwrap())
    }
    
    public required convenience init <V>(_ value: ExpressableState<V, Double>, _ shadowText: State<String>? = nil) {
        self.init(value.unwrap(), shadowText)
    }
    
    public required convenience init <V1, V2>(_ value: ExpressableState<V1, Double>, _ shadowText: ExpressableState<V2, String>) {
        self.init(value.unwrap(), shadowText.unwrap())
    }
}
