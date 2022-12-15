// swift-tools-version:5.7

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
	static func github(_ path: String, exact: Version) -> What {
		.init(dependency: .package(url: "https://github.com/\(path)", exact: exact))
	}
	static func github(_ path: String, range: Range<Version>) -> What {
		.init(dependency: .package(url: "https://github.com/\(path)", range))
	}
	static func github(_ path: String, branch: String) -> What {
		.init(dependency: .package(url: "https://github.com/\(path)", branch: branch))
	}
	static func github(_ path: String, revision: String) -> What {
		.init(dependency: .package(url: "https://github.com/\(path)", revision: revision))
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

deps.append(
	.github("swiftwasm/JavaScriptKit", exact: "0.17.0"),
		.product("JavaScriptKit", "JavaScriptKit"),
		.product("JavaScriptBigIntSupport", "JavaScriptKit")
)

// MARK: - Package

let package = Package(
    name: "web",
    products: [
        .library(name: "WebFoundation", type: .static, targets: ["WebFoundation"]),
        .library(name: "Events", type: .static, targets: ["Events"]),
        .library(name: "DOMEvents", type: .static, targets: ["DOMEvents"]),
        .library(name: "DOM", type: .static, targets: ["DOM"]),
        .library(name: "CSS", type: .static, targets: ["CSS"]),
        .library(name: "Web", type: .static, targets: ["Web"]),
        .library(name: "ARIA", type: .static, targets: ["ARIA"]),
        .library(name: "ServiceWorker", type: .static, targets: ["ServiceWorker"]),
        .library(name: "Worker", type: .static, targets: ["Worker"]),
        .library(name: "SharedWorker", type: .static, targets: ["SharedWorker"]),
        .library(name: "BeaconAPI", type: .static, targets: ["BeaconAPI"]),
        .library(name: "BluetoothAPI", type: .static, targets: ["BluetoothAPI"]),
        .library(name: "BroadcastChannelAPI", type: .static, targets: ["BroadcastChannelAPI"]),
        .library(name: "CanvasAPI", type: .static, targets: ["CanvasAPI"]),
        .library(name: "ChannelMessagingAPI", type: .static, targets: ["ChannelMessagingAPI"]),
        .library(name: "ClipboardAPI", type: .static, targets: ["ClipboardAPI"]),
        .library(name: "ContentIndexAPI", type: .static, targets: ["ContentIndexAPI"]),
        .library(name: "FetchAPI", type: .static, targets: ["FetchAPI"]),
        .library(name: "FullscreenAPI", type: .static, targets: ["FullscreenAPI"]),
        .library(name: "GamepadAPI", type: .static, targets: ["GamepadAPI"]),
        .library(name: "GeolocationAPI", type: .static, targets: ["GeolocationAPI"]),
        .library(name: "HistoryAPI", type: .static, targets: ["HistoryAPI"]),
        .library(name: "IndexedDB", type: .static, targets: ["IndexedDB"]),
        .library(name: "IntersectionObserverAPI", type: .static, targets: ["IntersectionObserverAPI"]),
        .library(name: "LocationAPI", type: .static, targets: ["LocationAPI"]),
        .library(name: "MediaCapabilitiesAPI", type: .static, targets: ["MediaCapabilitiesAPI"]),
        .library(name: "MediaStreamAPI", type: .static, targets: ["MediaStreamAPI"]),
        .library(name: "NavigationTimingAPI", type: .static, targets: ["NavigationTimingAPI"]),
        .library(name: "NavigatorAPI", type: .static, targets: ["NavigatorAPI"]),
        .library(name: "NotificationsAPI", type: .static, targets: ["NotificationsAPI"]),
        .library(name: "PaymentRequestAPI", type: .static, targets: ["PaymentRequestAPI"]),
        .library(name: "PeriodicBackgroundSynchronizationAPI", type: .static, targets: ["PeriodicBackgroundSynchronizationAPI"]),
        .library(name: "PictureInPictureAPI", type: .static, targets: ["PictureInPictureAPI"]),
        .library(name: "PushAPI", type: .static, targets: ["PushAPI"]),
        .library(name: "StorageAPI", type: .static, targets: ["StorageAPI"]),
        .library(name: "StreamsAPI", type: .static, targets: ["StreamsAPI"]),
        .library(name: "WebSocketAPI", type: .static, targets: ["WebSocketAPI"]),
        .library(name: "WorkersAPI", type: .static, targets: ["WorkersAPI"]),
        .library(name: "XMLHttpRequest", type: .static, targets: ["XMLHttpRequest"]),
        .library(name: "ResizeObserverAPI", type: .static, targets: ["ResizeObserverAPI"]),
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
            .target(name: "CSS"),
            .target(name: "FetchAPI"),
            .target(name: "WebSocketAPI"),
            .target(name: "XMLHttpRequest"),
            .target(name: "ResizeObserverAPI")
        ]),
        .target(name: "ARIA", dependencies: [
            .target(name: "WebFoundation"),
            .target(name: "DOM"),
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
        .target(name: "FetchAPI", dependencies: [
            .target(name: "WebFoundation"),
            .target(name: "StreamsAPI")
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
        .target(name: "StreamsAPI", dependencies: [
            .target(name: "WebFoundation")
        ]),
        .target(name: "WebSocketAPI", dependencies: [
            .target(name: "WebFoundation"),
            .target(name: "Events"),
            .target(name: "ChannelMessagingAPI"),
        ]),
        .target(name: "WorkersAPI", dependencies: [
            .target(name: "WebFoundation"),
            .target(name: "ChannelMessagingAPI")
        ]),
        .target(name: "XMLHttpRequest", dependencies: [
            .target(name: "WebFoundation"),
            .target(name: "Events")
        ]),
        .target(name: "ResizeObserverAPI", dependencies: [
            .target(name: "WebFoundation"),
            .target(name: "DOM")
        ]),
        .testTarget(name: "WebTests", dependencies: [
            .target(name: "Web")
        ])
    ]
)
