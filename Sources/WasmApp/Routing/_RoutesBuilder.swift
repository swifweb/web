////
////  RoutesBuilder.swift
////  
////
////  Created by Mihael Isaev on 20.11.2020.
////
//
//public protocol RoutesBuilderContent {
//    var routesBuilderContent: RoutesBuilderItem { get }
//}
//
//public enum RoutesBuilderItem {
//    case none
////    case group(Group)
//    case route(Route)
//    case viewController(ViewController)
//    case items([RoutesBuilderItem])
//}
//
//fileprivate struct _Content: RoutesBuilderContent {
//    let routesBuilderContent: RoutesBuilderItem
//}
//
//@_functionBuilder public struct _RoutesBuilder {
//    public typealias Block = () -> RoutesBuilderContent
//
//    public static func buildBlock() -> RoutesBuilderContent {
//        _Content(routesBuilderContent: .none)
//    }
//
//    public static func buildBlock(_ attrs: RoutesBuilderContent...) -> RoutesBuilderContent {
//        buildBlock(attrs)
//    }
//
//    public static func buildBlock(_ attrs: [RoutesBuilderContent]) -> RoutesBuilderContent {
//        _Content(routesBuilderContent: .items(attrs.map { $0.routesBuilderContent }))
//    }
//
//    public static func buildIf(_ content: RoutesBuilderContent?) -> RoutesBuilderContent {
//        guard let content = content else { return _Content(routesBuilderContent: .none) }
//        return _Content(routesBuilderContent: .items([content.routesBuilderContent]))
//    }
//
//    public static func buildEither(first: RoutesBuilderContent) -> RoutesBuilderContent {
//        _Content(routesBuilderContent: .items([first.routesBuilderContent]))
//    }
//
//    public static func buildEither(second: RoutesBuilderContent) -> RoutesBuilderContent {
//        _Content(routesBuilderContent: .items([second.routesBuilderContent]))
//    }
//}
