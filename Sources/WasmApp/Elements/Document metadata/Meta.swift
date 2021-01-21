//
//  Meta.swift
//  WasmApp
//
//  Created by Mihael Isaev on 18.12.2020.
//

import Foundation

/// The HTML `<meta>` element represents Metadata that cannot be represented
/// by other HTML meta-related elements, like base, link, script, style or title.
///
/// ```swift
/// Meta().charset("utf-8")
///
/// // Redirect page after 3 seconds
/// Meta().httpEquiv("refresh").content("3;url=https://www.mozilla.org")
/// ```
///
/// [Learn more ->](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/meta)
open class Meta: BaseElement {
    
}
