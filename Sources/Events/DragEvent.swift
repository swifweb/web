//
//  DragEvent.swift
//  Events
//
//  Created by Mihael Isaev on 24.02.2021.
//

import JavaScriptKit

public class DragEvent: MouseEvent {
    /// Returns the data that is dragged/dropped
    public let dataTransfer: DataTransferObject
    
    required init (_ event: JSValue) {
        dataTransfer = DataTransferObject(event.dataTransfer)
        super.init(event)
    }
}
