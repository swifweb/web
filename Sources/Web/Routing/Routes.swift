//
//  Routes.swift
//
//
//  Created by Mihael Isaev on 23.11.2020.
//

import Foundation
import DOM

public typealias Group = Routes.Group
public typealias Page = Routes.Page

public class FragmentRouter: DOMContent {
    lazy var defaultResponder = DefaultResponder(routes: routes)
    lazy var routes: RoutesStorage = .init()
    lazy var container = Div()
    
    public var domContentItem: DOMItem { .elements([container]) }
    
    public init (_ pageController: PageController) {
        pageController.fragments.append(self)
    }
    
    @discardableResult
    public func configure(_ handler: ((Div) -> Void)) -> Self {
        handler(container)
        return self
    }
    
    @discardableResult
    public func routes(@RoutesFactory content: @escaping RoutesFactory.Block) -> Self {
        Routes.parse(routes, content().routesFactoryContent)
        return self
    }
    
    // MARK: Responder
    
    private var rootPaths: [String: String] = [:]
    private var lastResponse: PageController?
    
    func canRespond(_ req: Request, _ rootPath: String) throws -> Bool {
        guard !routes.all.isEmpty else { return false }
        let relativePath = req.path.deletingPrefix(rootPath)
        if let lastResponse = lastResponse {
            // pass respond to view controller's subrouter
            if let lastReq = lastResponse.controller.req {
                if let rp = rootPaths[lastReq.path] {
                    if req.path.starts(with: rp) {
                        rootPaths[req.path] = rp
                        if try lastResponse.controller.canRespond(req, rp) {
                            return true
                        }
                    }
                }
            }
            #if arch(wasm32)
            lastResponse.controller.willUnload()
            container.domElement.removeChild(lastResponse.controller.view)
            lastResponse.controller.didRemoveFromDOM()
            lastResponse.controller.didUnload()
            #endif
        }
        let subRequest = Request(
            application: req.application,
            path: relativePath,
            search: req.search,
            hash: req.hash
        )
        guard let response = try defaultResponder.respond(to: subRequest) else { return false }
        
        for fragment in response.controller.fragments {
            do {
                let rootPath: String
                if let rp = req.route?.rootPath?.joined(separator: "/") {
                    rootPath = rp.hasPrefix("/") ? rp : "/\(rp)"
                } else {
                    rootPath = req.path
                }
                rootPaths[req.path] = rootPath
                _ = try fragment.canRespond(req, rootPath)
            } catch {
                print("Unable to render subroute: \(error)")
            }
        }
        
        #if arch(wasm32)
        response.controller.willLoad(with: req)
        container.appendChild(response.controller)
        response.controller.req = req
        response.controller.didAddToDOM()
        response.controller.didLoad(with: req)
        #endif
        lastResponse = response
        return true
    }
}

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
        Self.parse(collection, item)
    }
    
    static func parse(_ builder: RoutesBuilder, _ item: RoutesFactory.Item) {
        switch item {
        case .none: break
        case .items(let items):
            items.forEach { parse(builder, $0) }
        case .endpoint(let endpoint):
            guard let endpoint = endpoint as? _AnyRoutesEndpoint else { break }
            guard let pageController = try? endpoint.closure(.init(application: WebApp.shared, path: endpoint.path.joined(separator: "/"))) else { break }
            builder.add(Route(
                path: endpoint.path,
                responder: BasicResponder { try endpoint.closure($0) }
            ))
            for fragment in pageController.fragments {
                for route in fragment.routes.all {
                    var p = endpoint.path
                    p.append(contentsOf: route.path)
                    builder.add(Route(
                        path: p,
                        rootPath: endpoint.path,
                        responder: BasicResponder { try endpoint.closure($0) }
                    ))
                }
            }
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
    var closure: (Request) throws -> PageController { get }
}

extension Routes {
    public class Page: _AnyRoutesEndpoint, RoutesFactoryContent {
        public var routesFactoryContent: RoutesFactory.Item { .endpoint(self) }
        
        var path: [String]
        var closure: (Request) throws -> PageController
        
        public init (_ path: [String], use closure: @escaping (Request) throws -> PageController) {
            self.path = path
            self.closure = closure
        }
        
        public convenience init (_ path: String..., use closure: @escaping (Request) throws -> PageController) {
            self.init(path, use: closure)
        }
        
        public convenience init (_ path: [String], use closure: @escaping () throws -> PageController) {
            self.init(path) { _ in
                try closure()
            }
        }
        
        public convenience init (_ path: String..., use closure: @escaping () throws -> PageController) {
            self.init(path, use: closure)
        }
    }
}
