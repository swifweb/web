//
//  InputFile.swift
//  Web
//
//  Created by Mihael Isaev on 25.12.2020.
//

import Foundation
import JavaScriptKit

/// A control that lets the user select a file.
/// Use the accept attribute to define the types of files that the control can select.
///
/// The HTML `<input>` element is used to create interactive controls
/// for web-based forms in order to accept data from the user;
/// a wide variety of types of input data and control widgets are available,
/// depending on the device and user agent.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/input)
open class InputFile: BaseActiveElement, _ChangeHandleable, _InvalidHandleable, _SelectHandleable {
    public override class var name: String { "input" }
    
    @State public internal(set) var files: [File] = []
    
    var changeClosure: ChangeClosure?
    var changeHandler: (HandledEvent) -> Void = { _ in }
    
    func onChange(_ event: HandledEvent) {
        let count = Int(domElement.files.length.number ?? 0)
        if count > 0 {
            var files: [File] = []
            // maybe the new way soon
            if let array = domElement.files.array {
                array.forEach {
                    guard let file = File($0) else { return }
                    files.append(file)
                }
            } else {
                (0...count - 1).forEach { i in
                    guard let value = domElement.files.item.function?.callAsFunction(this: domElement.files.object, i) else { return }
                    guard let file = File(value) else { return }
                    files.append(file)
                }
            }
            self.files = files
        }
    }
    
    var invalidClosure: InvalidClosure?
    var invalidHandler: (HandledEvent) -> Void = { _ in }
    
    var selectClosure: SelectClosure?
    var selectHandler: (UIEvent) -> Void = { _ in }
    
    deinit {
        changeClosure?.release()
        invalidClosure?.release()
        selectClosure?.release()
    }
    
    public required init() {
        super.init()
        subscribeToChanges()
        domElement.type = "file".jsValue()
    }
}

extension InputFile {
    public struct File: CustomStringConvertible {
        public let lastModified: Date
        public let name: String
        public let size: UInt
        public let type: String
        public let webkitRelativePath: String
        
        init? (_ value: JSValue) {
            guard !value.isNull && !value.isUndefined else { return nil }
            let lm = value.lastModified.number ?? 0
            lastModified = Date(timeIntervalSince1970: lm > 0 ? lm / 1_000 : 0)
            name = value.name.string ?? ""
            size = UInt(value.size.number ?? 0)
            type = value.type.string ?? ""
            webkitRelativePath = value.webkitRelativePath.string ?? ""
        }
        
        public var description: String {
            "InputFile.File(name: \(name), size: \(size), type: \(type), lastModified: \(lastModified.timeIntervalSince1970))"
        }
    }
}
