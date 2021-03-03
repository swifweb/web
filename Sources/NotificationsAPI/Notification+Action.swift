//
//  Notification+Action.swift
//  NotificationsAPI
//
//  Created by Mihael Isaev on 23.02.2021.
//

import JavaScriptKit

extension Notification {
    public struct Action: Codable, ConvertibleToJSValue {
        public func jsValue() -> JSValue {
            var dict: [String: ConvertibleToJSValue] = [:]
            dict["action"] = action
            dict["title"] = title
            if let icon = icon {
                dict["icon"] = icon
            }
            return dict.jsValue()
        }
        
        /// The name of the action, which can be used to identify the clicked action similar to input names.
        public let action: String
        
        /// The string describing the action that is displayed to the user.
        public let title: String
        
        /// URL of the image used to represent the notification when there is not enough space to display the notification itself.
        public let icon: String?
        
        public init (_ action: String, title: String, icon: String? = nil) {
            self.action = action
            self.title = title
            self.icon = icon
        }
    }
}
