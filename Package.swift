// swift-tools-version:5.3

import PackageDescription
import Foundation

// MARK: - Conveniences

let localDev = false
let devDir = "../../"

struct Dep {
    let package: PackageDescription.Package.Dependency
    let targets: [Target.Dependency]
}

struct What {
    let dependency: Package.Dependency

    static func local(_ path: String) -> What {
        .init(dependency: .package(path: "\(devDir)\(path)"))
    }
    static func github(_ path: String, _ from: Version) -> What {
        .init(dependency: .package(url: "https://github.com/\(path)", from: from))
    }
    static func github(_ path: String, _ requirement: PackageDescription.Package.Dependency.Requirement) -> What {
        .init(dependency: .package(url: "https://github.com/\(path)", requirement))
    }
}

extension Array where Element == Dep {
    mutating func append(_ what: What, _ targets: Target.Dependency...) {
        append(.init(package: what.dependency, targets: targets))
    }
}

extension Target.Dependency {
    static func product(_ name: String, _ package: String? = nil) -> Target.Dependency {
        .product(name: name, package: package ?? name)
    }
}

// MARK: - Dependencies

var deps: [Dep] = []

deps.append(.github("swiftwasm/JavaScriptKit", "0.9.0"), .product("JavaScriptKit", "JavaScriptKit"))

// MARK: - Package

let package = Package(
    name: "Web",
    products: [
        .library(name: "WebFoundation", targets: ["WebFoundation"]),
        .library(name: "Events", targets: ["Events"]),
        .library(name: "DOMEvents", targets: ["DOMEvents"]),
        .library(name: "DOM", targets: ["DOM"]),
        .library(name: "CSS", targets: ["CSS"]),
        .library(name: "Web", targets: ["Web"]),
        .library(name: "ServiceWorker", targets: ["ServiceWorker"]),
        .library(name: "Worker", targets: ["Worker"]),
        .library(name: "SharedWorker", targets: ["SharedWorker"]),
        .library(name: "BeaconAPI", targets: ["BeaconAPI"]),
        .library(name: "BluetoothAPI", targets: ["BluetoothAPI"]),
        .library(name: "BroadcastChannelAPI", targets: ["BroadcastChannelAPI"]),
        .library(name: "CanvasAPI", targets: ["CanvasAPI"]),
        .library(name: "ChannelMessagingAPI", targets: ["ChannelMessagingAPI"]),
        .library(name: "ClipboardAPI", targets: ["ClipboardAPI"]),
        .library(name: "ContentIndexAPI", targets: ["ContentIndexAPI"]),
        .library(name: "FullscreenAPI", targets: ["FullscreenAPI"]),
        .library(name: "GamepadAPI", targets: ["GamepadAPI"]),
        .library(name: "GeolocationAPI", targets: ["GeolocationAPI"]),
        .library(name: "HistoryAPI", targets: ["HistoryAPI"]),
        .library(name: "IndexedDB", targets: ["IndexedDB"]),
        .library(name: "IntersectionObserverAPI", targets: ["IntersectionObserverAPI"]),
        .library(name: "LocationAPI", targets: ["LocationAPI"]),
        .library(name: "MediaCapabilitiesAPI", targets: ["MediaCapabilitiesAPI"]),
        .library(name: "MediaStreamAPI", targets: ["MediaStreamAPI"]),
        .library(name: "NavigationTimingAPI", targets: ["NavigationTimingAPI"]),
        .library(name: "NavigatorAPI", targets: ["NavigatorAPI"]),
        .library(name: "NotificationsAPI", targets: ["NotificationsAPI"]),
        .library(name: "PaymentRequestAPI", targets: ["PaymentRequestAPI"]),
        .library(name: "PeriodicBackgroundSynchronizationAPI", targets: ["PeriodicBackgroundSynchronizationAPI"]),
        .library(name: "PictureInPictureAPI", targets: ["PictureInPictureAPI"]),
        .library(name: "PushAPI", targets: ["PushAPI"]),
        .library(name: "StorageAPI", targets: ["StorageAPI"]),
        .library(name: "WorkersAPI", targets: ["WorkersAPI"]),
    ],
    dependencies: deps.map { $0.package },
    targets: [
        .target(
            name: "WebFoundation",
            dependencies: deps.flatMap { $0.targets }
        ),
        .target(name: "Events", dependencies: [
            .target(name: "WebFoundation")
        ]),
        .target(name: "DOMEvents", dependencies: [
            .target(name: "Events")
        ]),
        .target(name: "DOM", dependencies: [
            .target(name: "DOMEvents"),
            .target(name: "HistoryAPI"),
            .target(name: "LocationAPI"),
            .target(name: "NavigatorAPI"),
            .target(name: "StorageAPI")
        ]),
        .target(name: "CSS", dependencies: [
            .target(name: "WebFoundation"),
            .target(name: "DOM")
        ]),
        .target(name: "Web", dependencies: [
            .target(name: "WebFoundation"),
            .target(name: "DOM"),
            .target(name: "DOMEvents"),
            .target(name: "CSS")
        ]),
        .target(name: "ServiceWorker", dependencies: [
            .target(name: "WebFoundation"),
            .target(name: "WorkersAPI")
        ]),
        .target(name: "Worker", dependencies: [
            .target(name: "WebFoundation"),
            .target(name: "WorkersAPI"),
            .target(name: "ChannelMessagingAPI")
        ]),
        .target(name: "SharedWorker", dependencies: [
            .target(name: "WebFoundation"),
            .target(name: "WorkersAPI"),
            .target(name: "ChannelMessagingAPI")
        ]),
        .target(name: "BeaconAPI", dependencies: [
            .target(name: "WebFoundation")
        ]),
        .target(name: "BluetoothAPI", dependencies: [
            .target(name: "WebFoundation")
        ]),
        .target(name: "BroadcastChannelAPI", dependencies: [
            .target(name: "WebFoundation")
        ]),
        .target(name: "CanvasAPI", dependencies: [
            .target(name: "WebFoundation")
        ]),
        .target(name: "ChannelMessagingAPI", dependencies: [
            .target(name: "WebFoundation"),
            .target(name: "Events")
        ]),
        .target(name: "ClipboardAPI", dependencies: [
            .target(name: "WebFoundation")
        ]),
        .target(name: "ContentIndexAPI", dependencies: [
            .target(name: "WebFoundation")
        ]),
        .target(name: "FullscreenAPI", dependencies: [
            .target(name: "WebFoundation")
        ]),
        .target(name: "GamepadAPI", dependencies: [
            .target(name: "WebFoundation")
        ]),
        .target(name: "GeolocationAPI", dependencies: [
            .target(name: "WebFoundation")
        ]),
        .target(name: "HistoryAPI", dependencies: [
            .target(name: "WebFoundation"),
            .target(name: "LocationAPI")
        ]),
        .target(name: "IndexedDB", dependencies: [
            .target(name: "WebFoundation")
        ]),
        .target(name: "IntersectionObserverAPI", dependencies: [
            .target(name: "WebFoundation")
        ]),
        .target(name: "LocationAPI", dependencies: [
            .target(name: "WebFoundation")
        ]),
        .target(name: "MediaCapabilitiesAPI", dependencies: [
            .target(name: "WebFoundation")
        ]),
        .target(name: "MediaStreamAPI", dependencies: [
            .target(name: "WebFoundation")
        ]),
        .target(name: "NavigationTimingAPI", dependencies: [
            .target(name: "WebFoundation")
        ]),
        .target(name: "NavigatorAPI", dependencies: [
            .target(name: "WebFoundation"),
            .target(name: "Events"),
            .target(name: "ContentIndexAPI"),
            .target(name: "NotificationsAPI"),
            .target(name: "PushAPI"),
            .target(name: "WorkersAPI")
        ]),
        .target(name: "NotificationsAPI", dependencies: [
            .target(name: "WebFoundation")
        ]),
        .target(name: "PaymentRequestAPI", dependencies: [
            .target(name: "WebFoundation")
        ]),
        .target(name: "PeriodicBackgroundSynchronizationAPI", dependencies: [
            .target(name: "WebFoundation")
        ]),
        .target(name: "PictureInPictureAPI", dependencies: [
            .target(name: "WebFoundation")
        ]),
        .target(name: "PushAPI", dependencies: [
            .target(name: "WebFoundation")
        ]),
        .target(name: "StorageAPI", dependencies: [
            .target(name: "WebFoundation")
        ]),
        .target(name: "WorkersAPI", dependencies: [
            .target(name: "WebFoundation"),
            .target(name: "ChannelMessagingAPI")
        ]),
        .testTarget(name: "WebTests", dependencies: [
            .target(name: "Web")
        ])
    ]
)
