//
//  RoutesBuilder+Group.swift
//
//
//  Created by Mihael Isaev on 23.11.2020.
//  Credits to https://github.com/vapor/vapor
//

extension RoutesBuilder {
    // MARK: Path
    
    /// Creates a new `Router` that will automatically prepend the supplied path components.
    ///
    ///     let users = router.grouped("user")
    ///     // Adding "user/auth/" route to router.
    ///     users.get("auth") { ... }
    ///     // adding "user/profile/" route to router
    ///     users.get("profile") { ... }
    ///
    /// - parameters:
    ///     - path: Group path components separated by commas.
    /// - returns: Newly created `Router` wrapped in the path.
    public func grouped(_ path: String...) -> RoutesBuilder {
        grouped(path)
    }

    /// Creates a new `Router` that will automatically prepend the supplied path components.
    ///
    ///     let users = router.grouped(["user"])
    ///     // Adding "user/auth/" route to router.
    ///     users.get("auth") { ... }
    ///     // adding "user/profile/" route to router
    ///     users.get("profile") { ... }
    ///
    /// - parameters:
    ///     - path: Array of group path components.
    /// - returns: Newly created `Router` wrapped in the path.
    public func grouped(_ path: [String]) -> RoutesBuilder {
        HTTPRoutesGroup(root: self, path: path)
    }

    /// Creates a new `Router` that will automatically prepend the supplied path components.
    ///
    ///     router.group("user") { users in
    ///         // Adding "user/auth/" route to router.
    ///         users.get("auth") { ... }
    ///         // adding "user/profile/" route to router
    ///         users.get("profile") { ... }
    ///     }
    ///
    /// - parameters:
    ///     - path: Group path components separated by commas.
    ///     - configure: Closure to configure the newly created `Router`.
    public func group(_ path: String..., configure: (RoutesBuilder) throws -> ()) rethrows {
        try group(path, configure: configure)
    }

    /// Creates a new `Router` that will automatically prepend the supplied path components.
    ///
    ///     router.group(["user"]) { users in
    ///         // Adding "user/auth/" route to router.
    ///         users.get("auth") { ... }
    ///         // adding "user/profile/" route to router
    ///         users.get("profile") { ... }
    ///     }
    ///
    /// - parameters:
    ///     - path: Array of group path components.
    ///     - configure: Closure to configure the newly created `Router`.
    public func group(_ path: [String], configure: (RoutesBuilder) throws -> ()) rethrows {
        try configure(HTTPRoutesGroup(root: self, path: path))
    }
}

/// Groups routes
private final class HTTPRoutesGroup: RoutesBuilder {
    /// Router to cascade to.
    let root: RoutesBuilder
    
    /// Additional components.
    let path: [String]

    /// Creates a new `PathGroup`.
    init(root: RoutesBuilder, path: [String]) {
        self.root = root
        self.path = path
    }
    
    /// See `HTTPRoutesBuilder`.
    func add(_ route: Route) {
        route.path = path + route.path
        root.add(route)
    }
}
