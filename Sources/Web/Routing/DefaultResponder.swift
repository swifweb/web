//
//  DefaultResponder.swift
//
//
//  Created by Mihael Isaev on 22.11.2020.
//  Credits to https://github.com/vapor/vapor
//

import Foundation

private struct CachedRoute {
    let route: Route
    let responder: Responder
    
    init (_ paths: String..., responder: Responder) {
        self.route = .init(path: paths, responder: responder)
        self.responder = responder
    }
}

/// Vapor's main `Responder` type. Combines configured middleware + router to create a responder.
internal struct DefaultResponder: Responder {
    private let router: TrieRouter<CachedRoute>
    private let notFoundResponder: Responder?

    private struct CachedRoute {
        let route: Route
        let responder: Responder
    }

    /// Creates a new `ApplicationResponder`
    init(routes: RoutesStorage, notFoundResponder: Responder? = nil, middleware: [Middleware] = []) {
        let options = routes.caseInsensitive ?
            Set(arrayLiteral: TrieRouter<CachedRoute>.ConfigurationOption.caseInsensitive) : []
        let router = TrieRouter(CachedRoute.self, options: options)
        
        for route in routes.all {
            // Make a copy of the route to cache middleware chaining.
            let cached = CachedRoute(
                route: route,
                responder: middleware.makeResponder(chainingTo: route.responder)
            )
            // remove any empty path components
            let path = route.path.map { $0.components(separatedBy: "/").map { PathComponent(stringLiteral: $0) } }.flatMap { $0 }.filter { component in
                switch component {
                case .constant(let string):
                    return string != ""
                default:
                    return true
                }
            }
            router.register(cached, at: path)
        }
        self.router = router
        if let notFoundResponder = notFoundResponder {
            self.notFoundResponder = middleware.makeResponder(chainingTo: notFoundResponder)
        } else {
            self.notFoundResponder = nil
        }
    }
    
    func respond(to request: Request) throws -> PageController? {
        if let cachedRoute = getRoute(for: request) {
            request.route = cachedRoute.route
            return try cachedRoute.responder.respond(to: request)
        } else if let notFoundResponder = notFoundResponder {
            return try notFoundResponder.respond(to: request)
        }
        return nil
    }
    
    /// Gets a `Route` from the underlying `TrieRouter`.
    private func getRoute(for request: Request) -> CachedRoute? {
        router.route(
            path: request.path.split(separator: "/").map(String.init),
            parameters: &request.parameters
        )
    }
}

extension DefaultResponder {
    static var notFoundResponder: Responder {
        NotFoundResponder()
    }
}

private struct NotFoundResponder: Responder {
    func respond(to request: Request) throws -> PageController? {
        NotFoundPageController()
    }
}

private class NotFoundPageController: PageController {
    required init() {
        super.init()
        view.object?.innerHTML = "Nothing has been found".jsValue
    }
}
