//
//  FontVariantLigaturesType.swift
//  WasmApp
//
//  Created by Mihael Isaev on 09.07.2020.
//

public protocol FontVariantLigaturable: Valuable {
    static var commonLigatures: Self { get }
    static var noCommonLigatures: Self { get }
    static var discretionaryLigatures: Self { get }
    static var noDiscretionaryLigatures: Self { get }
    static var historicalLigatures: Self { get }
    static var noHistoricalLigatures: Self { get }
    static var contextual: Self { get }
    static var noContextual: Self { get }
}

extension FontVariantLigaturable {
    /// This value activating control on the most common ligatures, like for fi, ffi, th or similar.
    /// They correspond to the OpenType values `liga` and `clig`.
    public static var commonLigatures: Self { .init("common-ligatures") }
    
    /// This value deactivating control on the most common ligatures, like for fi, ffi, th or similar.
    /// They correspond to the OpenType values `liga` and `clig`.
    public static var noCommonLigatures: Self { .init("no-common-ligatures") }
    
    /// This value activating control on specific ligatures, specific to the font and defined by the type designer.
    /// They correspond to the OpenType values `dlig`.
    public static var discretionaryLigatures: Self { .init("discretionary-ligatures") }
    
    /// This value deactivating control on specific ligatures, specific to the font and defined by the type designer.
    /// They correspond to the OpenType values `dlig`.
    public static var noDiscretionaryLigatures: Self { .init("no-discretionary-ligatures") }
    
    /// This value activating control on the ligatures used historically,
    /// in old books, like the German tz digraph being displayed ß.
    /// They correspond to the OpenType values `hlig`.
    public static var historicalLigatures: Self { .init("historical-ligatures") }
    
    /// This value deactivating control on the ligatures used historically,
    /// in old books, like the German tz digraph being displayed ß.
    /// They correspond to the OpenType values `hlig`.
    public static var noHistoricalLigatures: Self { .init("no-historical-ligatures") }
    
    /// This value activating control on whether letters adapt to their context—that is,
    /// whether they adapt to the surrounding letters.
    /// These values correspond to the OpenType values `calt`.
    public static var contextual: Self { .init("contextual") }
    
    /// This value deactivating control on whether letters adapt to their context—that is,
    /// whether they adapt to the surrounding letters.
    /// These values correspond to the OpenType values `calt`.
    public static var noContextual: Self { .init("no-contextual") }
}

public struct FontVariantLigaturesType: Noneable, FontVariantLigaturable, CustomStringConvertible {
    public let value: String
    
    public init (_ value: String) { self.value = value }
    
    /// This keyword leads to the activation of the usual ligatures
    /// and contextual forms needed for correct rendering.
    /// The ligatures and forms activated depend on the font,
    /// language and kind of script. This is the default value.
    public static var normal: Self { .init("normal") }
    
    public var description: String { value }
}
