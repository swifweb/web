//
//  Manifest+Category.swift
//  ServiceWorker
//
//  Created by Mihael Isaev on 22.02.2021.
//

extension Manifest {
    public struct Category: Codable, ExpressibleByStringLiteral, CustomStringConvertible {
        public var value: String
        public var description: String { value }
        
        public init(_ value: String) {
            self.value = value
        }
        
        public init(stringLiteral value: String) {
            self.value = value
        }
        
        public static var books: Self = "books"
        public static var business: Self = "business"
        public static var education: Self = "education"
        public static var entertainment: Self = "entertainment"
        public static var finance: Self = "finance"
        public static var fitness: Self = "fitness"
        public static var food: Self = "food"
        public static var games: Self = "games"
        public static var government: Self = "government"
        public static var health: Self = "health"
        public static var kids: Self = "kids"
        public static var lifestyle: Self = "lifestyle"
        public static var magazines: Self = "magazines"
        public static var medical: Self = "medical"
        public static var music: Self = "music"
        public static var navigation: Self = "navigation"
        public static var news: Self = "news"
        public static var personalization: Self = "personalization"
        public static var photo: Self = "photo"
        public static var politics: Self = "politics"
        public static var productivity: Self = "productivity"
        public static var security: Self = "security"
        public static var shopping: Self = "shopping"
        public static var social: Self = "social"
        public static var sports: Self = "sports"
        public static var travel: Self = "travel"
        public static var utilities: Self = "utilities"
        public static var weather: Self = "weather"
    }
}
