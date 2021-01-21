//
//  DataTransferObject.swift
//  Web
//
//  Created by Mihael Isaev on 30.11.2020.
//

import JavaScriptKit

public class DataTransferObject {
    let object: JSValue
    
    /// Gets the type of drag-and-drop operation currently selected or sets the operation to a new type.
    public let dropEffect: DataTransferDropEffect
    
    /// Provides all of the types of operations that are possible.
    public let effectAllowed: DataTransferEffectAllowed
    
    /// Contains a list of all the local files available on the data transfer.
    /// If the drag operation doesn't involve dragging files, this property is an empty list.
    public let files: [File]

    /// Gives a DataTransferItemList object which is a list of all of the drag data.
    public let items: [DataTransferItem]

    /// An array of strings giving the formats that were set in the dragstart event.
    public let types: [String]
    
    init (_ object: JSValue) {
        self.object = object
        guard !object.isNull && !object.isUndefined else {
            dropEffect = .none
            effectAllowed = .none
            files = []
            items = []
            types = []
            return
        }
        dropEffect = DataTransferDropEffect(rawValue: object.dropEffect.string ?? "") ?? .none
        effectAllowed = DataTransferEffectAllowed(rawValue: object.effectAllowed.string ?? "") ?? .none
        if let v = object.files.object, let arr = JSArray(v) {
            var files: [File] = []
            let iterator = arr.makeIterator()
            while let val = iterator.next() {
                files.append(File(val))
            }
            self.files = files
        } else {
            files = []
        }
        if let v = object.items.object, let arr = JSArray(v) {
            var items: [DataTransferItem] = []
            let iterator = arr.makeIterator()
            while let val = iterator.next() {
                items.append(DataTransferItem(val))
            }
            self.items = items
        } else {
            items = []
        }
        if let v = object.types.object, let arr = JSArray(v) {
            var types: [String] = []
            let iterator = arr.makeIterator()
            while let val = iterator.next() {
                if let str = val.string {
                    types.append(str)
                }
            }
            self.types = types
        } else {
            types = []
        }
    }
}
