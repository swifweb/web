//
//  TrieRouter.swift
//
//
//  Created by Mihael Isaev on 22.11.2020.
//  Credits to https://github.com/vapor/vapor
//

import Foundation

/// Generic `TrieRouter` built using the "trie" tree algorithm.
///
/// Use `register(...)` to register routes into the router. Use `route(...)` to then fetch a matching
/// route's output.
///
/// See https://en.wikipedia.org/wiki/Trie for more information.
public final class TrieRouter<Output>: Router, CustomStringConvertible {
    /// Available `TrieRouter` customization options.
    public enum ConfigurationOption {
        /// If set, this will cause the router's route matching to be case-insensitive.
        /// - note: Case-insensitive routing may be less performant than case-sensitive routing.
        case caseInsensitive
    }
    
    /// Configured options such as case-sensitivity.
    public var options: Set<ConfigurationOption>

    /// The root node.
    private var root: Node

    /// Create a new `TrieRouter`.
    ///
    /// - parameters:
    ///     - options: Configured options such as case-sensitivity.
    public init(_ type: Output.Type = Output.self, options: Set<ConfigurationOption> = []) {
        self.root = Node()
        self.options = options
    }

    /// Registers a new `Route` to this router.
    ///
    ///     let route = Route<Int>(path: [.constant("users"), User.parameter], output: ...)
    ///     let router = TrieRouter<Int>()
    ///     router.register(route: route)
    ///
    /// - parameters:
    ///     - route: `Route` to register to this router.
    public func register(_ output: Output, at path: [PathComponent]) {
        // start at the root of the trie branch
        var current = self.root

        // for each dynamic path in the route get the appropriate
        // child, generate a new one if necessary
        for (index, component) in path.enumerated() {
            switch component {
            case .catchall:
                precondition(index == path.count - 1, "Catchall ('\(component)') must be the last component in a path.")
                fallthrough
            default:
                current = current.buildOrFetchChild(for: component, options: self.options)
            }
        }

        // if this node already has output, we are overriding a route
        if current.output != nil {
            print("[Routing] Warning: Overriding route output at: \(path.string)")
        }
        
        // after iterating over all path components, we can set the output
        // on the current node
        current.output = output
    }

    /// Routes a `path`, returning the best-matching output and collecting any dynamic parameters.
    ///
    ///     var params = Parameters()
    ///     router.route(path: ["users", "Vapor"], parameters: &params)
    ///
    /// - parameters:
    ///     - path: Array of `RoutableComponent` to route against.
    ///     - params: A mutable `Parameters` to collect dynamic parameters.
    /// - returns: Best-matching output for the supplied path.
    public func route(path: [String], parameters: inout Parameters) -> Output? {
        // always start at the root node
        var currentNode: Node = self.root
        
        let isCaseInsensitive = self.options.contains(.caseInsensitive)

        var currentCatchall: (Node, [String])?

        // traverse the string path supplied
        search: for (index, slice) in path.enumerated() {
            // store catchall in case search hits dead end
            if let catchall = currentNode.catchall {
                currentCatchall = (catchall, [String](path.dropFirst(index)))
            }
            // check the constants first
            if let constant = currentNode.constants[isCaseInsensitive ? slice.lowercased() : slice] {
                currentNode = constant
                continue search
            }
            // no constants matched, check for dynamic members
            if let (name, parameter) = currentNode.parameter {
                // if no constant routes were found that match the path, but
                // a dynamic parameter child was found, we can use it
                parameters.set(name, to: slice)
                currentNode = parameter
                continue search
            }
            // check for anythings
            if let anything = currentNode.anything {
                currentNode = anything
                continue search
            }
            // no matches, stop searching
            if let (catchall, subpaths) = currentCatchall {
                // fallback to catchall output if we have one
                parameters.setCatchall(matched: subpaths)
                return catchall.output
            } else {
                return nil
            }
        }

        if let output = currentNode.output {
            // return the currently resolved responder if there hasn't been an early exit.
            return output
        } else if let (catchall, subpaths) = currentCatchall {
            // fallback to catchall output if we have one
            parameters.setCatchall(matched: subpaths)
            return catchall.output
        } else {
            // current node has no output and there was not catchall
            return nil
        }
    }
    
    public var description: String {
        return self.root.description
    }
}

extension TrieRouter {
    /// A single node of the `Router`s trie tree of routes.
    final class Node: CustomStringConvertible {
        /// All constant child nodes.
        var constants: [String: Node]
        
        /// Parameter child node, if one exists.
        var parameter: (String, Node)?
        
        /// Catchall node, if one exists.
        /// This node should not have any child nodes.
        var catchall: Node?
        
        /// Anything child node, if one exists.
        var anything: Node?
        
        /// This node's output
        var output: Output?
        
        /// Creates a new `RouterNode`.
        init(output: Output? = nil) {
            self.output = output
            self.constants = [String: Node]()
        }
        
        /// Fetches the child `RouterNode` for the supplied path component, or builds
        /// a new segment onto the tree if necessary.
        func buildOrFetchChild(for component: PathComponent, options: Set<ConfigurationOption>) -> Node {
            let isCaseInsensitive = options.contains(.caseInsensitive)
            
            switch component {
            case .constant(let string):
                // We're going to be comparing this path against an incoming losercased path later
                // so it's more efficient to lowercase it up front
                let string = isCaseInsensitive ? string.lowercased() : string
                
                // search for existing constant
                if let node = self.constants[string] {
                    return node
                }
                
                // none found, add a new node
                let node = Node()
                self.constants[string] = node
                return node
            case .parameter(let name):
                let node: Node
                if let (existingName, existingNode) = self.parameter {
                    node = existingNode
                    assert(existingName == name, "Route parameter name mis-match \(existingName) != \(name)")
                } else {
                    node = Node()
                    self.parameter = (name, node)
                }
                return node
            case .catchall:
                let node: Node
                if let fallback = self.catchall {
                    node = fallback
                } else {
                    node = Node()
                    self.catchall = node
                }
                return node
            case .anything:
                let node: Node
                if let anything = self.anything {
                    node = anything
                } else {
                    node = Node()
                    self.anything = node
                }
                return node
            }
        }
        
        var description: String {
            self.subpathDescriptions.joined(separator: "\n")
        }
        
        var subpathDescriptions: [String] {
            var desc: [String] = []
            for (name, constant) in self.constants {
                desc.append("→ \(name)")
                desc += constant.subpathDescriptions.indented()
            }
            if let (name, parameter) = self.parameter {
                desc.append("→ :\(name)")
                desc += parameter.subpathDescriptions.indented()
            }
            if let anything = self.anything {
                desc.append("→ *")
                desc += anything.subpathDescriptions.indented()
            }
            if let _ = self.catchall {
                desc.append("→ **")
            }
            return desc
        }
    }
}

private extension Array where Element == String {
    func indented() -> [String] {
        return self.map { "  " + $0 }
    }
}
