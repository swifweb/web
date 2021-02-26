//
//  Manifest.swift
//  Service
//
//  Created by Mihael Isaev on 22.02.2021.
//

import Foundation

open class Manifest: Codable, ServiceBuilderContent {
    public var serviceBuilderContent: ServiceBuilder.Item { .manifest(self) }
    
    // MARK: Name
    
    public var name: String = "Swift PWA"
    
    /// The name of the web application
    /// as it is usually displayed to the user (e.g., amongst a list of other applications, or as a label for an icon).
    ///
    /// - Parameter value: Name string
    public func name(_ value: String) -> Self {
        name = value
        return self
    }
    
    /// The name of the web application
    /// as it is usually displayed to the user (e.g., amongst a list of other applications, or as a label for an icon).
    ///
    /// - Parameter value: Name string
    public static func name(_ value: String) -> Self {
        Self().name(value)
    }
    
    // MARK: Short name
    
    public var shortName: String?
    
    /// The name of the web application displayed to the user if there is not enough space to display name
    /// (e.g., as a label for an icon on the phone home screen).
    ///
    /// - Parameter value: Short name string
    public func shortName(_ value: String) -> Self {
        shortName = value
        return self
    }
    
    /// The name of the web application displayed to the user if there is not enough space to display name
    /// (e.g., as a label for an icon on the phone home screen).
    ///
    /// - Parameter value: Short name string
    public static func shortName(_ value: String) -> Self {
        Self().shortName(value)
    }
    
    // MARK: Description
    
    public var description: String?
    
    /// The `description` string in which developers can explain what the application does.
    ///
    /// - Parameter value: Description string
    public func description(_ value: String) -> Self {
        description = value
        return self
    }
    
    /// The `description` string in which developers can explain what the application does.
    ///
    /// - Parameter value: Description string
    public static func description(_ value: String) -> Self {
        Self().description(value)
    }
    
    // MARK: Language
    
    public var lang: String?
    
    /// A single language tag.
    /// It specifies the primary language for the values of the manifest's
    /// directionality-capable members, and together with dir determines their directionality.
    ///
    /// - Parameter value: The language tag, e.g. `en-US`
    public func lang(_ value: String) -> Self {
        lang = value
        return self
    }
    
    /// A single language tag.
    /// It specifies the primary language for the values of the manifest's
    /// directionality-capable members, and together with dir determines their directionality.
    ///
    /// - Parameter value: The language tag, e.g. `en-US`
    public static func lang(_ value: String) -> Self {
        Self().lang(value)
    }
    
    // MARK: Direction
    
    public var dir: String?
    
    /// The base direction in which to display direction-capable members of the manifest.
    ///
    /// Together with the lang member, it helps to correctly display right-to-left languages.
    ///
    /// - Parameter value: DirType
    public func dir(_ value: Dir) -> Self {
        dir = value.rawValue
        return self
    }
    
    /// The base direction in which to display direction-capable members of the manifest.
    ///
    /// Together with the lang member, it helps to correctly display right-to-left languages.
    ///
    /// - Parameter value: DirType
    public static func dir(_ value: Dir) -> Self {
        Self().dir(value)
    }
    
    // MARK: Start URL
    
    public var startURL: String = "."
    
    /// Represents the start URL of the web application — the preferred URL
    /// that should be loaded when the user launches the web application.
    ///
    /// e.g., when the user taps on the web application's icon from a device's application menu or homescreen
    ///
    /// - Parameter value: Absolute or relative URL, e.g. `.` for root path (and by default).
    public func startURL(_ value: String) -> Self {
        startURL = value
        return self
    }
    
    /// Represents the start URL of the web application — the preferred URL
    /// that should be loaded when the user launches the web application.
    ///
    /// e.g., when the user taps on the web application's icon from a device's application menu or homescreen
    ///
    /// - Parameter value: Absolute or relative URL, e.g. `.` for root path (and by default).
    public static func startURL(_ value: String) -> Self {
        Self().startURL(value)
    }
    
    // MARK: Display
    
    public var display: Display?
    
    /// It determines the developers’ preferred display mode for the website.
    ///
    /// The display mode changes how much of browser UI is shown to the user
    /// and can range from browser (when the full browser window is shown)
    /// to fullscreen (when the app is full-screened).
    ///
    /// - Parameter value: Display type, `.standalone` by default
    public func display(_ value: Display) -> Self {
        display = value
        return self
    }
    
    /// It determines the developers’ preferred display mode for the website.
    ///
    /// The display mode changes how much of browser UI is shown to the user
    /// and can range from browser (when the full browser window is shown)
    /// to fullscreen (when the app is full-screened).
    ///
    /// - Parameter value: Display type, `.standalone` by default
    public static func display(_ value: Display) -> Self {
        Self().display(value)
    }
    
    // MARK: Background color
    
    public var backgroundColor: String?
    
    /// Defines a placeholder background color for the application page
    /// to display before its stylesheet is loaded.
    ///
    /// This value is used by the user agent to draw the background color
    /// of a shortcut when the manifest is available before the stylesheet has loaded.
    ///
    /// Therefore `backgroundColor` should match the background-color CSS property in the site’s stylesheet
    /// for a smooth transition between launching the web application and loading the site's content.
    ///
    /// - Parameter value: CSS color value, e.g. `red` or `#ff0000`
    public func backgroundColor(_ value: String) -> Self {
        backgroundColor = value
        return self
    }
    
    /// Defines a placeholder background color for the application page
    /// to display before its stylesheet is loaded.
    ///
    /// This value is used by the user agent to draw the background color
    /// of a shortcut when the manifest is available before the stylesheet has loaded.
    ///
    /// Therefore `backgroundColor` should match the background-color CSS property in the site’s stylesheet
    /// for a smooth transition between launching the web application and loading the site's content.
    ///
    /// - Parameter value: CSS color value, e.g. `red` or `#ff0000`
    public static func backgroundColor(_ value: String) -> Self {
        Self().backgroundColor(value)
    }
    
    // MARK: Theme color
    
    public var themeColor: String?
    
    /// Defines the default theme color for the application.
    ///
    /// This sometimes affects how the OS displays the site (e.g., on Android's task switcher, the theme color surrounds the site).
    ///
    /// - Parameter value: CSS color value, e.g. `red` or `#ff0000`
    public func themeColor(_ value: String) -> Self {
        themeColor = value
        return self
    }
    
    /// Defines the default theme color for the application.
    ///
    /// This sometimes affects how the OS displays the site (e.g., on Android's task switcher, the theme color surrounds the site).
    ///
    /// - Parameter value: CSS color value, e.g. `red` or `#ff0000`
    public static func themeColor(_ value: String) -> Self {
        Self().themeColor(value)
    }
    
    // MARK: Icons
    
    public var icons: [Image] = []
    
    /// An array of objects representing image files that can serve as application icons for different contexts.
    ///
    /// For example, they can be used to represent the web application amongst a list
    /// of other applications, or to integrate the web application
    /// with an OS's task switcher and/or system preferences.
    public func icons(_ values: [Image]) -> Self {
        icons = values
        return self
    }
    
    /// An array of objects representing image files that can serve as application icons for different contexts.
    ///
    /// For example, they can be used to represent the web application amongst a list
    /// of other applications, or to integrate the web application
    /// with an OS's task switcher and/or system preferences.
    public func icons(_ values: Image...) -> Self {
        icons(values)
    }
    
    /// An array of objects representing image files that can serve as application icons for different contexts.
    ///
    /// For example, they can be used to represent the web application amongst a list
    /// of other applications, or to integrate the web application
    /// with an OS's task switcher and/or system preferences.
    public static func icons(_ values: [Image]) -> Self {
        Self().icons(values)
    }
    
    /// An array of objects representing image files that can serve as application icons for different contexts.
    ///
    /// For example, they can be used to represent the web application amongst a list
    /// of other applications, or to integrate the web application
    /// with an OS's task switcher and/or system preferences.
    public static func icons(_ values: Image...) -> Self {
        Self().icons(values)
    }
    
    // MARK: Categories
    
    public var categories: [String] = []
    
    /// The categories member is an array of strings defining the names of categories that the application supposedly belongs to.
    ///
    /// There is no standard list of possible values,
    /// but the W3C maintains [a list of known categories](https://github.com/w3c/manifest/wiki/Categories).
    ///
    /// - Parameter values: Category list, you could select predefined enum values and also writedown a custom string
    public func categories(_ values: [Category]) -> Self {
        categories = values.map { $0.description }
        return self
    }
    
    /// The categories member is an array of strings defining the names of categories that the application supposedly belongs to.
    ///
    /// There is no standard list of possible values,
    /// but the W3C maintains [a list of known categories](https://github.com/w3c/manifest/wiki/Categories).
    ///
    /// - Parameter values: Category list, you could select predefined enum values and also writedown a custom string
    public func categories(_ values: Category...) -> Self {
        categories(values)
    }
    
    /// The categories member is an array of strings defining the names of categories that the application supposedly belongs to.
    ///
    /// There is no standard list of possible values,
    /// but the W3C maintains [a list of known categories](https://github.com/w3c/manifest/wiki/Categories).
    ///
    /// - Parameter values: Category list, you could select predefined enum values and also writedown a custom string
    public static func categories(_ values: [Category]) -> Self {
        Self().categories(values)
    }
    
    /// The categories member is an array of strings defining the names of categories that the application supposedly belongs to.
    ///
    /// There is no standard list of possible values,
    /// but the W3C maintains [a list of known categories](https://github.com/w3c/manifest/wiki/Categories).
    ///
    /// - Parameter values: Category list, you could select predefined enum values and also writedown a custom string
    public static func categories(_ values: Category...) -> Self {
        Self().categories(values)
    }
    
    // MARK: International age rating identificator
    
    public var iarcRatingId: String?
    
    /// The iarc_rating_id member is a string that represents the
    /// [International Age Rating Coalition (IARC)](https://www.globalratings.com/)
    /// certification code of the web application.
    /// It is intended to be used to determine which ages the web application is appropriate for.
    ///
    /// - Parameter value: Rating identificator string
    public func iarcRatingId(_ value: String) -> Self {
        iarcRatingId = value
        return self
    }
    
    /// The iarc_rating_id member is a string that represents the
    /// [International Age Rating Coalition (IARC)](https://www.globalratings.com/)
    /// certification code of the web application.
    /// It is intended to be used to determine which ages the web application is appropriate for.
    ///
    /// - Parameter value: Rating identificator string
    public static func iarcRatingId(_ value: String) -> Self {
        Self().iarcRatingId(value)
    }
    
    // MARK: Orientation
    
    public var orientation: String?
    
    /// Defines the default orientation for all the website's top-level.
    ///
    /// **Note**: orientation and/or its specific values might not be supported
    /// by a user agent on various display modes because supporting them does not make sense for the particular context.
    ///
    /// **Note**: The orientation can be changed at runtime
    /// via the [Screen Orientation API](https://developer.mozilla.org/en-US/docs/Web/API/Screen/orientation).
    ///
    /// - Parameter value: Orientation type, e.g. `.portraitPrimary`
    public func orientation(_ value: Orientation) -> Self {
        orientation = value.rawValue
        return self
    }
    
    /// Defines the default orientation for all the website's top-level.
    ///
    /// **Note**: orientation and/or its specific values might not be supported
    /// by a user agent on various display modes because supporting them does not make sense for the particular context.
    ///
    /// **Note**: The orientation can be changed at runtime
    /// via the [Screen Orientation API](https://developer.mozilla.org/en-US/docs/Web/API/Screen/orientation).
    ///
    /// - Parameter value: Orientation type, e.g. `.portraitPrimary`
    public static func orientation(_ value: Orientation) -> Self {
        Self().orientation(value)
    }
    
    // MARK: Prefer related applications
    
    public var preferRelatedApplications: Bool?
    
    /// Specifies that applications listed in `relatedApplications` should be preferred
    /// over the web application. If the `preferRelatedApplications` member is set to true,
    /// the user agent might suggest installing one of the related applications instead of this web app.
    ///
    /// If omitted, `preferRelatedApplications` defaults to false.
    ///
    /// - Parameter value: Boolean flag
    public func preferRelatedApplications(_ value: Bool) -> Self {
        preferRelatedApplications = value
        return self
    }
    
    /// Specifies that applications listed in `relatedApplications` should be preferred
    /// over the web application. If the `preferRelatedApplications` member is set to true,
    /// the user agent might suggest installing one of the related applications instead of this web app.
    ///
    /// If omitted, `preferRelatedApplications` defaults to false.
    ///
    /// - Parameter value: Boolean flag
    public static func preferRelatedApplications(_ value: Bool) -> Self {
        Self().preferRelatedApplications(value)
    }
    
    // MARK: Related applications
    
    public var relatedApplications: [RelatedApplication]?
    
    /// Specifying native applications that are installable by, or accessible to,
    /// the underlying platform — for example, a native Android application obtainable
    /// through the Google Play Store. Such applications are intended to be alternatives
    /// to the manifest's website that provides similar/equivalent functionality — like the native app equivalent.
    ///
    /// - Parameter values: List of applications
    public func relatedApplications(_ values: [RelatedApplication]) -> Self {
        relatedApplications = values
        return self
    }
    
    /// Specifying native applications that are installable by, or accessible to,
    /// the underlying platform — for example, a native Android application obtainable
    /// through the Google Play Store. Such applications are intended to be alternatives
    /// to the manifest's website that provides similar/equivalent functionality — like the native app equivalent.
    ///
    /// - Parameter values: List of applications
    public func relatedApplications(_ values: RelatedApplication...) -> Self {
        relatedApplications(values)
    }
    
    /// Specifying native applications that are installable by, or accessible to,
    /// the underlying platform — for example, a native Android application obtainable
    /// through the Google Play Store. Such applications are intended to be alternatives
    /// to the manifest's website that provides similar/equivalent functionality — like the native app equivalent.
    ///
    /// - Parameter values: List of applications
    public static func relatedApplications(_ values: [RelatedApplication]) -> Self {
        Self().relatedApplications(values)
    }
    
    /// Specifying native applications that are installable by, or accessible to,
    /// the underlying platform — for example, a native Android application obtainable
    /// through the Google Play Store. Such applications are intended to be alternatives
    /// to the manifest's website that provides similar/equivalent functionality — like the native app equivalent.
    ///
    /// - Parameter values: List of applications
    public static func relatedApplications(_ values: RelatedApplication...) -> Self {
        Self().relatedApplications(values)
    }
    
    // MARK: Scope
    
    public var scope: String?
    
    /// The scope member is a string that defines the navigation scope
    /// of this web application's application context. It restricts what web pages
    /// can be viewed while the manifest is applied. If the user navigates outside the scope,
    /// it reverts to a normal web page inside a browser tab or window.
    ///
    /// If the scope is a relative URL, the base URL will be the URL of the manifest.
    ///
    /// - Parameter value: Path or URL
    public func scope(_ value: String) -> Self {
        scope = value
        return self
    }
    
    /// The scope member is a string that defines the navigation scope
    /// of this web application's application context. It restricts what web pages
    /// can be viewed while the manifest is applied. If the user navigates outside the scope,
    /// it reverts to a normal web page inside a browser tab or window.
    ///
    /// If the scope is a relative URL, the base URL will be the URL of the manifest.
    ///
    /// - Parameter value: Path or URL
    public static func scope(_ value: String) -> Self {
        Self().scope(value)
    }
    
    // MARK: Screenshots
    
    public var screenshots: [Image]?
    
    /// Screenshots intended to showcase the application.
    ///
    /// These images are intended to be used by progressive web app stores.
    ///
    /// - Parameter values: An array of screenshots
    public func screenshots(_ values: [Image]) -> Self {
        screenshots = values
        return self
    }
    
    /// Screenshots intended to showcase the application.
    ///
    /// These images are intended to be used by progressive web app stores.
    ///
    /// - Parameter values: An array of screenshots
    public func screenshots(_ values: Image...) -> Self {
        screenshots(values)
    }
    
    /// Screenshots intended to showcase the application.
    ///
    /// These images are intended to be used by progressive web app stores.
    ///
    /// - Parameter values: An array of screenshots
    public static func screenshots(_ values: [Image]) -> Self {
        Self().screenshots(values)
    }
    
    /// Screenshots intended to showcase the application.
    ///
    /// These images are intended to be used by progressive web app stores.
    ///
    /// - Parameter values: An array of screenshots
    public static func screenshots(_ values: Image...) -> Self {
        Self().screenshots(values)
    }
    
    // MARK: Shortcuts
    
    public var shortcuts: [Shortcut]?
    
    /// An array of shortcuts or links to key tasks or pages within a web app.
    ///
    /// A user agent can use these values to assemble a context menu to be displayed
    /// by the operating system when a user engages with the web app's icon.
    /// When user invokes a shortcut, the user agent will navigate to the address given by shortcut's url member.
    ///
    /// - Parameter values: An array of shortcuts
    public func shortcuts(_ values: [Shortcut]) -> Self {
        shortcuts = values
        return self
    }
    
    /// An array of shortcuts or links to key tasks or pages within a web app.
    ///
    /// A user agent can use these values to assemble a context menu to be displayed
    /// by the operating system when a user engages with the web app's icon.
    /// When user invokes a shortcut, the user agent will navigate to the address given by shortcut's url member.
    ///
    /// - Parameter values: An array of shortcuts
    public func shortcuts(_ values: Shortcut...) -> Self {
        shortcuts(values)
    }
    
    /// An array of shortcuts or links to key tasks or pages within a web app.
    ///
    /// A user agent can use these values to assemble a context menu to be displayed
    /// by the operating system when a user engages with the web app's icon.
    /// When user invokes a shortcut, the user agent will navigate to the address given by shortcut's url member.
    ///
    /// - Parameter values: An array of shortcuts
    public static func shortcuts(_ values: [Shortcut]) -> Self {
        Self().shortcuts(values)
    }
    
    /// An array of shortcuts or links to key tasks or pages within a web app.
    ///
    /// A user agent can use these values to assemble a context menu to be displayed
    /// by the operating system when a user engages with the web app's icon.
    /// When user invokes a shortcut, the user agent will navigate to the address given by shortcut's url member.
    ///
    /// - Parameter values: An array of shortcuts
    public static func shortcuts(_ values: Shortcut...) -> Self {
        Self().shortcuts(values)
    }
    
    public required init () {}
    
    private enum CodingKeys : String, CodingKey {
        case name
        case shortName = "short_name"
        case description
        case dir
        case lang
        case startURL = "start_url"
        case display
        case backgroundColor = "background_color"
        case themeColor = "theme_color"
        case icons
        case categories
        case iarcRatingId = "iarc_rating_id"
        case orientation
        case preferRelatedApplications = "prefer_related_applications"
        case relatedApplications = "related_applications"
        case scope
        case screenshots
        case shortcuts
    }
}
