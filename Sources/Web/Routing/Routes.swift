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

public final class FragmentRoutes {
    let routes = RoutesStorage()
    
    public init (@RoutesFactory content: @escaping RoutesFactory.Block) {
        Routes.parse(routes, content().routesFactoryContent)
    }
}

public class FragmentRouter: DOMContent {
    lazy var defaultResponder = DefaultResponder(routes: routes)
    let routes: RoutesStorage
    lazy var container = Div()
    
    public var domContentItem: DOMItem { .elements([container]) }
    
    public init (_ pageController: PageController, _ routes: FragmentRoutes) {
        self.routes = routes.routes
        pageController.fragments.append(self)
    }
    
    @discardableResult
    public func configure(_ handler: ((Div) -> Void)) -> Self {
        handler(container)
        return self
    }
    
    // MARK: Responder
    
    private var rootPaths: [String: String] = [:]
    private var lastResponse: AnyPageController?
    
    func canRespond(_ req: Request, _ rootPath: String, level: Int) throws -> Bool {
        let relativePath = req.path.deletingPrefix(rootPath)
        guard !routes.all.isEmpty else { return false }
        if let lastResponse = lastResponse {
            // pass respond to view controller's subrouter
            if let lastReq = lastResponse.controller.req {
                if let rp = rootPaths[lastReq.path] {
                    if req.path.starts(with: rp) {
                        rootPaths[req.path] = rp
                        if try lastResponse.controller.canRespond(req, rp, level: level + 1) {
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
        func wakeUpFragment(fragments: [FragmentRouter]) {
            for fragment in fragments {
                do {
                    let rootPath: String
                    if let rp = req.route?.rootPath?.joined(separator: "/") {
                        rootPath = rp.hasPrefix("/") ? rp : "/\(rp)"
                    } else {
                        rootPath = req.path
                    }
                    rootPaths[req.path] = rootPath
                    _ = try fragment.canRespond(req, rootPath, level: level + 1)
                } catch {
                    print("Unable to render subroute: \(error)")
                }
            }
        }
        wakeUpFragment(fragments: response.controller.fragments)
        
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
            guard let endpoint = endpoint as? (any _AnyRoutesEndpoint) else { break }
            let route = Route(
                path: endpoint.path,
                rootPath: endpoint.path,
                responder: BasicResponder { try endpoint.closure($0) as! PageController }
            )
            builder.add(route)
            for fragment in endpoint.pageClass.fragmentRoutes {
                for route in fragment.routes.all {
                    var p = endpoint.path
                    p.append(contentsOf: route.path)
                    builder.add(Route(
                        path: p,
                        rootPath: endpoint.path,
                        responder: BasicResponder { try endpoint.closure($0) as! PageController }
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

public protocol AnyRoutesEndpoint {
    associatedtype P: AnyPageController
}

protocol _AnyRoutesEndpoint: AnyRoutesEndpoint {
    var path: [String] { get }
    var closure: (Request) throws -> P { get }
    var pageClass: P.Type { get }
}

extension _AnyRoutesEndpoint {
    var pageClass: P.Type { P.self }
}

extension Routes {
    public class Page<P: AnyPageController>: _AnyRoutesEndpoint, RoutesFactoryContent {
        public var routesFactoryContent: RoutesFactory.Item { .endpoint(self) }
        
        var path: [String]
        var closure: (Request) throws -> P
        
        public init (_ path: [String], use closure: @escaping (Request) throws -> P) {
            self.path = path
            self.closure = closure
        }
        
        public convenience init (_ path: String..., use closure: @escaping (Request) throws -> P) {
            self.init(path, use: closure)
        }
        
        public convenience init (_ path: [String], use closure: @escaping () throws -> P) {
            self.init(path) { _ in
                try closure()
            }
        }
        
        public convenience init (_ path: String..., use closure: @escaping () throws -> P) {
            self.init(path, use: closure)
        }
    }
}
