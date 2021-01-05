//
//  TextJustifyType.swift
//  SwifCSS
//
//  Created by Mihael Isaev on 08.07.2020.
//

public struct TextJustifyType: Noneable, Autoable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// The text is justified by adding space between words (effectively varying word-spacing),
    /// which is most appropriate for languages that separate words using spaces, like English or Korean.
    public static var interWord: Self { .init("inter-word") }
    
    /// The text is justified by adding space between characters (effectively varying letter-spacing),
    /// which is most appropriate for languages like Japanese.
    public static var interCharacter: Self { .init("inter-character") }
    
    /// Exhibits the same behaviour as inter-character; this value is kept for backwards compatibility.
    public static var distribute: Self { .init("distribute") }
    
    public var description: String { value }
}
