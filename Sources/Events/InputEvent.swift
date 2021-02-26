//
//  InputEvent.swift
//  Events
//
//  Created by Mihael Isaev on 24.02.2021.
//

import JavaScriptKit

public class InputEvent: UIEvent {
    /// Returns the inserted characters
    public let data: String
    
    /// Returns an object containing information about the inserted/deleted data
    public let dataTransfer: DataTransferObject
    
//    /// Returns an array containing target ranges that will be affected by the insertion/deletion
//    public func getTargetRanges() -> [] {
//
//    }
    
    /// Returns the type of the change (i.e "inserting" or "deleting")
    public let inputType: InputType
    
    /// Returns whether the state of the event is composing or not
    public let isComposing: Bool
    
    required init (_ event: JSValue) {
        data = event.data.string ?? ""
        dataTransfer = DataTransferObject(event.dataTransfer)
        if event.inputType.isUndefined || event.inputType.isNull {
            inputType = .unknown
        } else {
            inputType = InputType(rawValue: event.inputType.string ?? "") ?? .unknown
        }
        isComposing = event.isComposing.boolean ?? false
        super.init(event)
    }
}
