//
//  Picture.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

/// The HTML `<picture>` element contains zero or more source elements
/// and one img element to offer alternative versions of an image for different display/device scenarios.
///
/// ```swift
/// Picture {
///     Source()
///         .srcset("/media/cc0-images/surfer-240-200.jpg")
///         .media("(min-width: 800px)")
///      Img()
///          .src("/media/cc0-images/painted-hand-298-332.jpg")
///          .alt("")
/// }
/// ```
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/picture)
open class Picture: BaseActiveElement {
    
}
