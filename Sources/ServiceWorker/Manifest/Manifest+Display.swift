//
//  Manifest+Display.swift
//  ServiceWorker
//
//  Created by Mihael Isaev on 22.02.2021.
//

extension Manifest {
    public enum Display: String, Codable {
        /// This is the default setting of PWA.
        /// In this display type, the web app looks and feels like a native app.
        ///
        /// - the web app runs in its own window separate from the browser.
        /// - the browser UI elements like the address bar and navigation are hidden.
        /// - the status bar of Android/iOS UI which shows the battery percentage etc. are still visible.
        case standalone
        
        /// If you want your web app to use the entire screen, this is the mode you need.
        /// As the name implies, your web app will open in full screen.
        ///
        /// - the entire display area is used by the app.
        /// - browser UI elements like address bar and navigation are hidden.
        /// - Android/iOS status bar is also hidden.
        case fullscreen
        
        /// In the minimal-UI display type, the web app will appear more
        /// or less like the “Standalone” mode, but some browser UI is retained.
        ///
        /// What is retained, will depend on the browser.
        /// For example, in Chrome, the address bar is displayed,
        /// but it cannot be typed into and the browser menu is available for navigation.
        ///
        /// - “standalone” mode + some browser UI elements.
        /// - user experience varies across browsers.
        case minimalUI = "minimal-ui"
        
        /// If you choose “Browser” as the display type, your web app
        /// will behave like a bookmark and the standard browser experience will be retained.
        ///
        /// **Using the Browser display mode will prevent the “Add to Home Screen” notice from appearing.**
        ///
        /// - all browser UI is retained.
        /// - the Add to Home Screen Notice is never displayed.
        case browser
    }
}
