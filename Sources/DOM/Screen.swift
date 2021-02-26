//
//  Screen.swift
//  DOM
//
//  Created by Mihael Isaev on 16.11.2020.
//

import WebFoundation

public struct Screen {
    /// Name of the element inside DOM
    let domElementName = "screen"
    
    /// Reference to DOM-object
    let domElement: JSValue
    
    /// Returns the height of the screen (excluding the Windows Taskbar)
    public let availHeight: Double
    
    /// Returns the width of the screen (excluding the Windows Taskbar)
    public let availWidth: Double
    
    /// Returns the total height of the screen
    public let height: Double
    
    /// Returns the total width of the screen
    public let width: Double
    
    /// Returns the bit depth of the color palette for displaying images
    public let colorDepth: Double
    
    /// Returns the color resolution (in bits per pixel) of the screen
    public let pixelDepth: Double
    
    /// Returns pixel ratio
    public let pixelRatio: Double
    
    init? (_ root: JSValue) {
        domElement = root[dynamicMember: domElementName]
        availHeight = domElement.availHeight.number ?? 0
        availWidth = domElement.availWidth.number ?? 0
        height = domElement.height.number ?? 0
        width = domElement.width.number ?? 0
        colorDepth = domElement.colorDepth.number ?? 0
        pixelDepth = domElement.pixelDepth.number ?? 0
        pixelRatio = root.devicePixelRatio.number ?? 1
    }
}
