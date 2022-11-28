//
//  ClickHandleable.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 29.11.2020.
//

import Events

public protocol ClickHandleable: DOMEventable {
    @discardableResult
    func onClick(_ handler: @escaping () -> Void) -> Self
}

fileprivate class ClickContainer: Container<MouseEvent>, StorageKey {
    typealias Value = ClickContainer
}

extension ClickHandleable {
    /// The `onclick` event occurs when the user clicks on an element.
    ///
    /// Applicable to all tags
    /// including SVG: `<image>`, `<line>`, `<linearGradient>`, `<marker>`, `<metadata>`, `<mpath>,
    /// `<path>`, `<pattern>`, `<polygon>`, `<polyline>`, `<radialGradient>`, `<rect>,
    /// `<script>`, `<set>`, `<stop>`, `<style>`, `<svg>`, `<switch>`, `<symbol>,
    /// `<text>`, `<textPath>`, `<title>`, `<tref>`, `<tspan>`, `<use>`, `<view>`
    /// except: `<base>`, `<bdo>`, `<br>`, `<head>`, `<html>`, `<iframe>`, `<meta>`, `<param>`, `<script>`, `<style>, and <title>`.
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onclick.asp)
    @discardableResult
    public func onClick(_ handler: @escaping (Self, MouseEvent) -> Void) -> Self {
        setDOMHandlerIfNeeded("onclick", createOrUpdate(ClickContainer.self) { [weak self] in
            guard let self = self else { return }
            handler(self, $0)
        })
    }
    
    /// The `onclick` event occurs when the user clicks on an element.
    ///
    /// Applicable to all tags
    /// including SVG: `<image>`, `<line>`, `<linearGradient>`, `<marker>`, `<metadata>`, `<mpath>,
    /// `<path>`, `<pattern>`, `<polygon>`, `<polyline>`, `<radialGradient>`, `<rect>,
    /// `<script>`, `<set>`, `<stop>`, `<style>`, `<svg>`, `<switch>`, `<symbol>,
    /// `<text>`, `<textPath>`, `<title>`, `<tref>`, `<tspan>`, `<use>`, `<view>`
    /// except: `<base>`, `<bdo>`, `<br>`, `<head>`, `<html>`, `<iframe>`, `<meta>`, `<param>`, `<script>`, `<style>, and <title>`.
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onclick.asp)
    @discardableResult
    public func onClick(_ handler: @escaping (Self) -> Void) -> Self {
        onClick { [weak self] _,_ in
            guard let self = self else { return }
            handler(self)
        }
    }
    
    /// The `onclick` event occurs when the user clicks on an element.
    ///
    /// Applicable to all tags
    /// including SVG: `<image>`, `<line>`, `<linearGradient>`, `<marker>`, `<metadata>`, `<mpath>,
    /// `<path>`, `<pattern>`, `<polygon>`, `<polyline>`, `<radialGradient>`, `<rect>,
    /// `<script>`, `<set>`, `<stop>`, `<style>`, `<svg>`, `<switch>`, `<symbol>,
    /// `<text>`, `<textPath>`, `<title>`, `<tref>`, `<tspan>`, `<use>`, `<view>`
    /// except: `<base>`, `<bdo>`, `<br>`, `<head>`, `<html>`, `<iframe>`, `<meta>`, `<param>`, `<script>`, `<style>, and <title>`.
    ///
    /// [More info →](https://www.w3schools.com/jsref/event_onclick.asp)
    @discardableResult
    public func onClick(_ handler: @escaping () -> Void) -> Self {
        onClick { _ in handler() }
    }
    
    /// Call it to imitate real click on the element
    public func click() {
        callFunction("click")
    }
}
