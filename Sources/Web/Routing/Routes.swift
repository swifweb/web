//
//  Routes.swift
//
//
//  Created by Mihael Isaev on 23.11.2020.
//

import Foundation

public typealias Group = Routes.Group
public typealias Page = Routes.Page

public class Routes: AppBuilderContent {
    public var appBuilderContent: AppBuilder.Item { .routes(self) }
    
    let item: RoutesFactory.Item
    
    init () {
        item = .none
    }
    
    public init (@RoutesFactory block: RoutesFactory.Block) {
        item = block().routesFactoryContent
    }
    
    func addRoutes(into collection: RoutesBuilder) {
        parse(collection, item)
    }
    
    private func parse(_ builder: RoutesBuilder, _ item: RoutesFactory.Item) {
        switch item {
        case .none: break
        case .items(let items):
            items.forEach { parse(builder, $0) }
        case .endpoint(let endpoint):
            guard let endpoint = endpoint as? _AnyRoutesEndpoint else { break }
            let responder = BasicResponder { request in
                try endpoint.closure(request)
            }
            builder.add(Route(
                path: endpoint.path,
                responder: responder
            ))
        case .group(let group):
            parse(builder.grouped(group.middlewares).grouped(group.path), group.routes.item)
        }
    }
}

extension Routes {
    public class Group: RoutesFactoryContent {
        public var routesFactoryContent: RoutesFactory.Item { .group(self) }
        
        let path: [String]
        var middlewares: [Middleware] = []
        var routes: Routes { _routes ?? Routes() }
        private var _routes: Routes?
        
        public init (_ path: [String]) {
            self.path = path
        }
        
        public init (_ path: String...) {
            self.path = path
        }
        
        public init (_ path: [String], protectedBy middlewares: [Middleware] = [], @RoutesFactory block: RoutesFactory.Block) {
            self.path = path
            self.middlewares = middlewares
            self._routes = .init(block: block)
        }
        
        public init (_ path: String..., protectedBy middlewares: [Middleware] = [], @RoutesFactory block: RoutesFactory.Block) {
            self.path = path
            self.middlewares = middlewares
            self._routes = .init(block: block)
        }
        
        public init<T>(_ path: [String], protectedBy middlewares: [Middleware] = [], controller: T.Type, @RoutesFactory block: (T.Type) -> RoutesFactory.Result) {
            self.path = path
            self.middlewares = middlewares
            self._routes = .init(block: {
                block(T.self)
            })
        }
        
        public init<T>(_ path: String..., protectedBy middlewares: [Middleware] = [], controller: T.Type, @RoutesFactory block: (T.Type) -> RoutesFactory.Result) {
            self.path = path
            self.middlewares = middlewares
            self._routes = .init(block: {
                block(T.self)
            })
        }
        
        public init (_ path: String..., protectBy middlewares: [Middleware] = [], routes: Routes) {
            self.path = path
            self.middlewares = middlewares
            self._routes = routes
        }
        
        public func protectedBy(_ middlewares: Middleware...) -> Self {
            protectedBy(middlewares)
        }
        
        public func protectedBy(_ middlewares: [Middleware]) -> Self {
            self.middlewares.append(contentsOf: middlewares)
            return self
        }
        
        public func routes(@RoutesFactory block: RoutesFactory.Block) -> Self {
            _routes = .init(block: block)
            return self
        }
        
        public func routes<T>(_ controller: T.Type, @RoutesFactory block: (T.Type) -> RoutesFactory.Result) -> Self {
            self._routes = .init(block: {
                block(T.self)
            })
            return self
        }
    }
}

public protocol AnyRoutesEndpoint {}

protocol _AnyRoutesEndpoint: AnyRoutesEndpoint {
    var path: [String] { get }
    var closure: (Request) throws -> Response { get }
}

extension Routes {
    public class Page: _AnyRoutesEndpoint, RoutesFactoryContent {
        public var routesFactoryContent: RoutesFactory.Item { .endpoint(self) }
        
        var path: [String]
        var closure: (Request) throws -> Response
        
        public init (_ path: [String], use closure: @escaping (Request) throws -> Response) {
            self.path = path
            self.closure = closure
        }
        
        public convenience init (_ path: String..., use closure: @escaping (Request) throws -> Response) {
            self.init(path, use: closure)
        }
        
        public convenience init (_ path: [String], use closure: @escaping () throws -> Response) {
            self.init(path) { _ in
                try closure()
            }
        }
        
        public convenience init (_ path: String..., use closure: @escaping () throws -> Response) {
            self.init(path, use: closure)
        }
    }
}
