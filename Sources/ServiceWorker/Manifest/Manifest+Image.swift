//
//  Manifest+Image.swift
//  ServiceWorker
//
//  Created by Mihael Isaev on 22.02.2021.
//

extension Manifest {
    public struct Image: Codable {
        public let src: String
        public let sizes: String
        public let type: String?
        public let purpose: String?
        
        /// Icon initializer
        /// - Parameters:
        ///   - path: Path to icon, e.g. `images/hello-icon-128.png`
        ///   - size: Size of an icon, e.g. `.x128`
        ///   - type: Type of image file like `.png` or `.webp` (optional)
        ///   - purpose: Defines the purpose of the image, for example if the image is intended
        ///   to serve some special purpose in the context of the host OS (i.e., for better integration).
        public init (src: String, sizes: [Size], type: ImageType? = nil, purpose: [Purpose]? = nil) {
            self.src = src
            self.sizes = sizes.map { $0.description }.joined(separator: " ")
            self.type = type?.description
            self.purpose = purpose?.map { $0.description }.joined(separator: " ")
        }
        
        /// Icon initializer
        /// - Parameters:
        ///   - path: Path to icon, e.g. `images/hello-icon-128.png`
        ///   - size: Size of an icon, e.g. `.x128`
        ///   - type: Type of image file like `.png` or `.webp` (optional)
        ///   - purpose: Defines the purpose of the image, for example if the image is intended
        ///   to serve some special purpose in the context of the host OS (i.e., for better integration).
        public init (src: String, sizes: Size..., type: ImageType? = nil, purpose: [Purpose]? = nil) {
            self.init(src: src, sizes: sizes, type: type, purpose: purpose)
        }
        
        public struct Size: Codable, ExpressibleByStringLiteral, CustomStringConvertible {
            public var value: String
            public var description: String { value }
            
            public init(_ value: String) {
                self.value = value
            }
            
            public init(stringLiteral value: String) {
                self.value = value
            }
            
            public static var x48: Self = "48x48"
            public static var x72: Self = "72x72"
            public static var x96: Self = "96x96"
            public static var x128: Self = "128x128"
            public static var x144: Self = "144x144"
            public static var x152: Self = "152x152"
            public static var x192: Self = "192x192"
            public static var x256: Self = "256x256"
            public static var x512: Self = "512x512"
        }
        
        public struct ImageType: Codable, ExpressibleByStringLiteral, CustomStringConvertible {
            public var value: String
            public var description: String { value }
            
            public init(_ value: String) {
                self.value = value
            }
            
            public init(stringLiteral value: String) {
                self.value = value
            }
            
            /// image/png
            public static var png: Self = "image/png"
            
            /// image/webp
            public static var webp: Self = "image/webp"
        }
        
        public struct Purpose: Codable, ExpressibleByStringLiteral, CustomStringConvertible {
            public var value: String
            public var description: String { value }
            
            public init(_ value: String) {
                self.value = value
            }
            
            public init(stringLiteral value: String) {
                self.value = value
            }
            
            /// A user agent can present this icon where a monochrome icon with a solid fill is needed.
            /// The color information in the icon is discarded and only the alpha data is used.
            /// The icon can then be used by the user agent like a mask over any solid fill.
            public static var monochrome: Self = "monochrome"
            
            /// The image is designed with icon masks and safe zone in mind,
            /// such that any part of the image outside the safe zone can safely
            /// be ignored and masked away by the user agent.
            public static var maskable: Self = "maskable"
            
            /// The user agent is free to display the icon in any context (this is the default value).
            public static var any: Self = "any"
        }
    }
}
