// swift-tools-version:5.3

import PackageDescription
import Foundation

// MARK: - Conveniences

let localDev = true//ProcessInfo.processInfo.environment["LIBS_DEVELOPMENT"] == "1"
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

deps.append(.github("swiftwasm/JavaScriptKit", "0.8.0"), .product("JavaScriptKit", "JavaScriptKit"))

if localDev {
    deps.append(.local("SwifWeb/WebCore"), .product("WebCore"))
} else {
    deps.append(.github("SwifWeb/WebCore", "1.0.0-beta"), .product("WebCore"))
}

// MARK: - Package

let package = Package(
    name: "WasmApp",
    products: [
        .library(name: "WasmApp", targets: ["WasmApp"]),
    ],
    dependencies: deps.map { $0.package },
    targets: [
        .target(name: "WasmApp", dependencies: deps.flatMap { $0.targets }),
        .testTarget(name: "WasmAppTests", dependencies: [
            .target(name: "WasmApp")
        ])
    ]
)
