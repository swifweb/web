//
//  Manifest+RelatedApplication.swift
//  ServiceWorker
//
//  Created by Mihael Isaev on 22.02.2021.
//

extension Manifest {
    public struct RelatedApplication: Codable {
        public struct Platform: Codable, ExpressibleByStringLiteral, CustomStringConvertible {
            public var value: String
            public var description: String { value }
            
            public init(_ value: String) {
                self.value = value
            }
            
            public init(stringLiteral value: String) {
                self.value = value
            }
            
            /// [Google Chrome Web Store](https://chrome.google.com/webstore)
            public static var chromeWebStore: Self = "chrome_web_store"
            
            /// [Google Play Store](https://play.google.com/)
            public static var play: Self = "play"
            
            /// [iTunes App Store](https://itunes.apple.com/us/genre/ios/)
            public static var itunes: Self = "itunes"
            
            /// [Web apps](https://www.w3.org/TR/appmanifest/)
            public static var webapp: Self = "webapp"
            
            /// [Windows App Store](https://www.microsoft.com/en-us/store/apps)
            public static var windows: Self = "windows"
        }
        
        /// The platform on which the application can be found.
        ///
        /// [List of available values](https://github.com/w3c/manifest/wiki/Platforms)
        public let platform: Platform
        
        /// The URL at which the application can be found.
        public let url: String
        
        /// The ID used to represent the application on the specified platform.
        public let id: String?
        
        public init (platform: Platform, url: String, id: String? = nil) {
            self.platform = platform
            self.url = url
            self.id = id
        }
    }
}
