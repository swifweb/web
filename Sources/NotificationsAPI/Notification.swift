//
//  Notification.swift
//  NotificationsAPI
//
//  Created by Mihael Isaev on 01.03.2021.
//

import WebFoundation

/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/API/Notification)
open class Notification: ConvertibleToJSValue {
	public enum Permission: String {
        /// The user has explicitly granted permission
        /// for the current origin to display system notifications.
        case granted
        
        /// The user has explicitly denied permission
        /// for the current origin to display system notifications.
        case denied
        
        /// The user decision is unknown,
        /// in this case the application will act as if permission was denied.
        case `default`
    }
    
    public static var permission: Permission {
        guard let permission = JSObject.global.Notification.function?.permission.string else {
            return .denied
        }
        return Permission(rawValue: permission) ?? .denied
    }
    
    /// Indicates the largest number of notification actions
    /// that can be presented to the user by the User Agent and the device.
    public static var maxActions: Int {
        guard let maxActions = JSObject.global.Notification.function?.maxActions.number else {
            return 0
        }
        return Int(maxActions)
    }
    
    public static func requestPermission(_ handler: @escaping (Permission) -> Void) {
        guard let requestPermission = JSObject.global.Notification.function?.requestPermission.function else {
            handler(.denied)
            return
        }
        func closure() -> JSOneshotClosure {
            JSOneshotClosure { args in
                guard let permission = args.first?.string else { return .null }
                handler(Permission(rawValue: permission) ?? .denied)
                return .null
            }
        }
		if let promise = requestPermission.callAsFunction(optionalThis: JSObject.global.Notification.object, closure()) {
			if !promise.isNull, !promise.isUndefined, let then = promise.then.function {
				then.callAsFunction(optionalThis: promise.object, closure())
			}
		}
    }
    
    let _jsValue: JSValue
	public var jsValue: JSValue { _jsValue }
    
    public init (_ value: JSValue) {
        _jsValue = value
    }
    
    /// Creates a new Notification object instance, which represents a user notification.
    ///
    /// - Parameters:
    ///   - title: Title for the notification, which is shown at the top of the notification window.
    ///   - body: Body text of the notification, which is displayed below the title.
    ///   - badge: A URL of the image used to represent the notification
    ///   when there isn't enough space to display the notification itself.
    ///   - tag: Identifying tag for the notification.
    ///   - data: Arbitrary data that you want associated with the notification. This can be of any data type.
    ///   - dir: Direction in which to display the notification.
    ///   - lang: Language tag, e.g. `en-US`.
    ///   - icon: URL of an icon to be displayed in the notification.
    ///   - image: URL of an image to be displayed in the notification.
    ///   - renotify: Specifying whether the user should be notified after a new notification replaces an old one.
    ///   The default is `false`, which means they won't be notified.
    ///   - requireInteraction: Indicates that a notification should remain active until the user clicks or dismisses it,
    ///   rather than closing automatically. The default value is `false`.
    ///   - actions: An array of NotificationActions representing the actions available to the user when the notification is presented.
    ///   These are options the user can choose among in order to act on the action within the context of the notification itself.
    ///   The action's name is sent to the service worker notification handler to let it know the action was selected by the user.
    ///   - vibrate: A vibration pattern for the device's vibration hardware to emit with the notification. e.g. `[200, 100, 200]`
    ///   - silent: Specifying whether the notification is silent (no sounds or vibrations issued), regardless of the device settings.
    ///   - timestamp: Timestamp of notification in seconds since 1970.
    ///   The default is `false`, which means it won't be silent.
    public init (
        title: String,
        body: String? = nil,
        badge: String? = nil,
        tag: String? = nil,
        data: String? = nil,
        dir: Dir? = nil,
        lang: String? = nil,
        icon: String? = nil,
        image: String? = nil,
        renotify: Bool? = nil,
        requireInteraction: Bool? = nil,
        actions: [Action]? = nil,
        vibrate: [Int]? = nil,
        silent: Bool? = nil,
        timestamp: Double? = nil
    ) {
        var options: [String: ConvertibleToJSValue] = [:]
        if let body = body { options["body"] = body }
        if let badge = badge { options["badge"] = badge }
        if let tag = tag { options["tag"] = tag }
        if let data = data { options["data"] = data }
        if let dir = dir { options["dir"] = dir.rawValue }
        if let lang = lang { options["lang"] = lang }
        if let icon = icon { options["icon"] = icon }
        if let image = image { options["image"] = image }
        if let renotify = renotify { options["renotify"] = renotify }
        if let requireInteraction = requireInteraction { options["requireInteraction"] = requireInteraction }
        if let actions = actions { options["actions"] = actions.jsValue }
        if let vibrate = vibrate { options["vibrate"] = vibrate.jsValue }
        if let silent = silent { options["silent"] = silent }
        if let timestamp = timestamp { options["timestamp"] = timestamp / 1_000 }
		_jsValue = JSObject.global.Notification.function?.new(title, options.jsValue).jsValue ?? .undefined
    }
    
    /// Used to close/remove a previously displayed notification.
    ///
    /// **Note**: This API shouldn't be used just to have the notification removed
    /// from the screen after a fixed delay since this method will also remove the notification
    /// from any notification tray, preventing users from interacting with it after it was initially shown.
    /// A valid use for this API would be to remove a notification that is no longer relevant
    /// (e.g. the user already read the notification on the webpage in the case of a messaging app
    /// or the following song is already playing in a music app).
    func close() {
        guard !_jsValue.isNull, !_jsValue.isUndefined else { return }
        _jsValue.close.function?.callAsFunction(optionalThis: _jsValue.object)
    }
}
