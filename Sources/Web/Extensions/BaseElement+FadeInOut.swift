//
//  BaseElement+FadeInOut.swift
//  Web
//
//  Created by Mihael Isaev on 14.06.2021.
//

import DOM

extension BaseElement {
    public enum FadeInBegin {
        case none
        case display(DisplayType)
        case visible
    }
    
    public enum FadeOutEnd {
        case none
        case hidden
        case invisible
        case collapsed
    }
    
    /// Fades in element in specified amount of time
    @discardableResult
    public func fadeIn(time: Double = 0.25, begin: FadeInBegin = .none, completion: (() -> Void)? = nil) -> Self {
        let interval: Double = 0.05
        let step = interval / time
        var opacity: Double = 0
        self.filter(.opacity(opacity * 100))
        switch begin {
        case .none: break
        case .display(let type):
            display(type)
        case .visible:
            visibility(.visible)
        }
        Dispatch.interval(interval) { task in
            opacity += step
            self.filter(.opacity(opacity * 100))
            if opacity >= 1 {
                task.invalidate()
                completion?()
            }
        }
        return self
    }
    
    /// Fades out element in specified amount of time
    @discardableResult
    public func fadeOut(time: Double = 0.25, end: FadeOutEnd = .none, completion: (() -> Void)? = nil) -> Self {
        let interval: Double = 0.05
        let step = interval / time
        var opacity: Double = 1
        self.filter(.opacity(opacity * 100))
        Dispatch.interval(interval) { task in
            opacity -= step
            self.filter(.opacity(opacity * 100))
            if opacity <= 0 {
                task.invalidate()
                switch end {
                case .none: break
                case .hidden:
                    self.display(.none)
                case .invisible:
                    self.visibility(.hidden)
                case .collapsed:
                    self.visibility(.collapse)
                }
                completion?()
            }
        }
        return self
    }
}
