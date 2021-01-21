//
//  RelType.swift
//  Web
//
//  Created by Mihael Isaev on 19.12.2020.
//

import Foundation

public final class RelType {
    public let value: String

    public init (_ value: String) {
        self.value = value
    }

    /// Alternate representations of the current document.
    public static var alternate: RelType { .init("alternate") }

    /// Author of the current document or article.
    public static var author: RelType { .init("author") }

    /// Permalink for the nearest ancestor section.
    public static var bookmark: RelType { .init("bookmark") }

    /// Preferred URL for the current document.
    public static var canonical: RelType { .init("canonical") }

    /// Tells the browser to preemptively perform DNS resolution for the target resource's origin
    public static var dnsPrefetch: RelType { .init("dns-prefetch") }

    /// The referenced document is not part of the same site as the current document.
    public static var external: RelType { .init("external") }

    /// Link to context-sensitive help.
    public static var help: RelType { .init("help") }

    /// An icon representing the current document.
    public static var icon: RelType { .init("icon") }

    /// Indicates that the main content of the current document is covered
    /// by the copyright license described by the referenced document.
    public static var license: RelType { .init("license") }

    /// Web app manifest
    public static var manifest: RelType { .init("manifest") }

    /// Tells to browser to preemptively fetch the script and store it
    /// in the document's module map for later evaluation.
    /// Optionally, the module's dependencies can be fetched as well.
    public static var modulePreload: RelType { .init("modulepreload") }

    /// Indicates that the current document is a part of a series
    /// and that the next document in the series is the referenced document.
    public static var next: RelType { .init("next") }

    /// Indicates that the current document's original author or publisher does not endorse the referenced document.
    public static var noFollow: RelType { .init("nofollow") }

    /// Creates a top-level browsing context that is not an auxiliary browsing context
    /// if the hyperlink would create either of those, to begin with (i.e., has an appropriate target attribute value).
    public static var noOpener: RelType { .init("noopener") }

    /// No Referer header will be included. Additionally, has the same effect as noopener.
    public static var noReferrer: RelType { .init("noreferrer") }

    /// Creates an auxiliary browsing context if the hyperlink
    /// would otherwise create a top-level browsing context
    /// that is not an auxiliary browsing context (i.e., has "_blank" as target attribute value).
    public static var opener: RelType { .init("opener") }

    /// Gives the address of the pingback server that handles pingbacks to the current document.
    public static var pingBack: RelType { .init("pingback") }

    /// Specifies that the user agent should preemptively connect to the target resource's origin.
    public static var preConnect: RelType { .init("preconnect") }

    /// Specifies that the user agent should preemptively fetch
    /// and cache the target resource as it is likely to be required for a followup navigation.
    public static var prefetch: RelType { .init("prefetch") }

    /// Specifies that the user agent must preemptively fetch
    /// and cache the target resource for current navigation
    /// according to the potential destination given by the
    /// as attribute (and the priority associated with the corresponding destination).
    public static var preLoad: RelType { .init("preload") }

    /// Specifies that the user agent should preemptively fetch the target resource
    /// and process it in a way that helps deliver a faster response in the future.
    public static var preRender: RelType { .init("prerender") }

    /// Indicates that the current document is a part of a series and
    /// that the previous document in the series is the referenced document.
    public static var prev: RelType { .init("prev") }

    /// Gives a link to a resource that can be used
    /// to search through the current document and its related pages.
    public static var search: RelType { .init("search") }

    /// Imports a style sheet.
    public static var stylesheet: RelType { .init("stylesheet") }

    /// Gives a tag (identified by the given address) that applies to the current document.
    public static var tag: RelType { .init("tag") }
}
