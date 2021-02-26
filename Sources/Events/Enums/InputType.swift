//
//  InputType.swift
//  Events
//
//  Created by Mihael Isaev on 24.02.2021.
//

import Foundation

public enum InputType: String {
    case insertText
    case insertReplacementText
    case insertLineBreak
    case insertParagraph
    case insertOrderedList
    case insertUnorderedList
    case insertHorizontalRule
    case insertFromYank
    case insertFromDrop
    case insertFromPaste
    case insertTranspose
    case insertCompositionText
    case insertFromComposition
    case insertLink
    case deleteByComposition
    case deleteCompositionText
    case deleteWordBackward
    case deleteWordForward
    case deleteSoftLineBackward
    case deleteSoftLineForward
    case deleteEntireSoftLine
    case deleteHardLineBackward
    case deleteHardLineForward
    case deleteByDrag
    case deleteByCut
    case deleteByContent
    case deleteContentBackward
    case deleteContentForward
    case historyUndo
    case historyRedo
    case formatBold
    case formatItalic
    case formatUnderline
    case formatStrikethrough
    case formatSuperscript
    case formatSubscript
    case formatJustifyFull
    case formatJustifyCenter
    case formatJustifyRight
    case formatJustifyLeft
    case formatIndent
    case formatOutdent
    case formatRemove
    case formatSetBlockTextDirection
    case formatSetInlineTextDirection
    case formatBackColor
    case formatFontColor
    case formatFontName
    case unknown
}
