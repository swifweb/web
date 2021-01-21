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
        .library(name: "Web", targets: ["Web"]),
    ],
    dependencies: deps.map { $0.package },
    targets: [
        .target(name: "Web", dependencies: deps.flatMap { $0.targets }),
        .testTarget(name: "WebTests", dependencies: [
            .target(name: "Web")
        ])
    ]
)
