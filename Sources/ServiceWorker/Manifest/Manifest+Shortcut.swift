//
//  Manifest+Shortcut.swift
//  ServiceWorker
//
//  Created by Mihael Isaev on 22.02.2021.
//

extension Manifest {
    public struct Shortcut: Codable {
        /// A string that can be displayed to the user in a context menu.
        public let name: String
        
        /// A string that can be displayed where there is insufficient space to display the full name of the shortcut.
        public let shortName: String?
        
        /// A string that describes the purpose of the shortcut. It may be exposed to assistive technology.
        public let description: String?
        
        /// A URL within the application that opens when the shortcut is activated.
        public let url: String
        
        /// A set of icons that represent the shortcut. They can be used, e.g., in the context menu.
        public let icons: [Image]?
        
        public init (name: String, shortName: String? = nil, description: String? = nil, url: String, icons: [Image]) {
            self.name = name
            self.shortName = shortName
            self.description = description
            self.url = url
            self.icons = icons.count > 0 ? icons : nil
        }
        
        public init (name: String, shortName: String? = nil, description: String? = nil, url: String, icons: Image...) {
            self.init(name: name, shortName: shortName, description: description, url: url, icons: icons)
        }
        
        private enum CodingKeys : String, CodingKey {
            case name, description, url, icons
            case shortName = "short_name"
        }
    }
}
