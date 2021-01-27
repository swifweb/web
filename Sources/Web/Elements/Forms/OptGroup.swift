//
//  OptGroup.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

/// The HTML `<optgroup>` element creates a grouping of options within a select element.
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/optgroup)
open class OptGroup: BaseActiveElement {
    @State public var label: String = ""
    
    public required convenience init(_ label: String) {
        self.init()
        setAttribute("label", label)
        self.label = label
        _label.listen { [weak self] in
            self?.setAttribute("label", $0)
        }
    }
    
    public convenience init(_ label: String, @BodyBuilder content: @escaping BodyBuilder.Block) {
        self.init(label)
        parseBodyBuilderItem(content().bodyBuilderContent)
    }
    
    public required convenience init(_ label: State<String>) {
        self.init()
        self.label = label.wrappedValue
        _label.wrappedValue = label.wrappedValue
        _label.merge(with: label, leftChanged: { [weak self] in
            self?.setAttribute("label", $0)
        }, rightChanged: { [weak self] in
            self?.setAttribute("label", $0)
        })
    }
    
    public convenience init(_ label: State<String>, @BodyBuilder content: @escaping BodyBuilder.Block) {
        self.init(label)
        parseBodyBuilderItem(content().bodyBuilderContent)
    }
    
    public required convenience init <V>(_ value: ExpressableState<V, String>) {
        self.init(value.unwrap())
    }
    
    public required convenience init <V>(_ value: ExpressableState<V, String>, @BodyBuilder content: @escaping BodyBuilder.Block) {
        self.init(value.unwrap(), content: content)
    }
}
