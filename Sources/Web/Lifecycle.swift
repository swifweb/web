//
//  File.swift
//  
//
//  Created by Mihael Isaev on 15.11.2020.
//

public var Lifecycle: LifecycleBuilderProtocol { LifecycleBuilder() }

public protocol LifecycleBuilderProtocol: class, AppBuilderContent {
    /// Called when app just started
    func didFinishLaunching(_ handler: @escaping () -> Void) -> Self
    
    /// Called when app is going to die
    func willTerminate(_ handler: @escaping () -> Void) -> Self
    
    /// Called when window is active
    func didBecomeActive(_ handler: @escaping () -> Void) -> Self
    
    /// Called when window is not active
    func willResignActive(_ handler: @escaping () -> Void) -> Self
    
    /// Called when window is going into background, e.g. user switch tab
    func didEnterBackground(_ handler: @escaping () -> Void) -> Self
    
    /// Called when window is going into foreground, e.g. user switch back to tab with the app
    func willEnterForeground(_ handler: @escaping () -> Void) -> Self
}

extension LifecycleBuilderProtocol {
    public var appBuilderContent: AppBuilder.Item { .lifecycle(self) }
}

protocol _LifecycleBuilderProtocol: LifecycleBuilderProtocol {
    var _didFinishLaunching: (() -> Void)? { get set }
    var _willTerminate: (() -> Void)? { get set }
    var _didBecomeActive: (() -> Void)? { get set }
    var _willResignActive: (() -> Void)? { get set }
    var _didEnterBackground: (() -> Void)? { get set }
    var _willEnterForeground: (() -> Void)? { get set }
}

class LifecycleBuilder: _LifecycleBuilderProtocol {
    init () {}
    
    // MARK: Finish Launching

    var _didFinishLaunching: (() -> Void)?
    
    /// Called when app just started
    public func didFinishLaunching(_ handler: @escaping () -> Void) -> Self {
        _didFinishLaunching = handler
        return self
    }
    
    // MARK: Will Terminate
    
    var _willTerminate: (() -> Void)?
    
    /// Called when app is going to die
    public func willTerminate(_ handler: @escaping () -> Void) -> Self {
        _willTerminate = handler
        return self
    }
    
    // MARK: Become Active
    
    var _didBecomeActive: (() -> Void)?
    
    /// Called when window is active
    public func didBecomeActive(_ handler: @escaping () -> Void) -> Self {
        _didBecomeActive = handler
        return self
    }
    
    // MARK: Resign Active

    var _willResignActive: (() -> Void)?
    
    /// Called when window is not active
    public func willResignActive(_ handler: @escaping () -> Void) -> Self {
        _willResignActive = handler
        return self
    }
    
    // MARK: Did Enter Background
    
    var _didEnterBackground: (() -> Void)?
    
    /// Called when window is going into background, e.g. user switch tab
    public func didEnterBackground(_ handler: @escaping () -> Void) -> Self {
        _didEnterBackground = handler
        return self
    }
    
    // MARK: Will Enter Foreground

    var _willEnterForeground: (() -> Void)?
    
    /// Called when window is going into foreground, e.g. user switch back to tab with the app
    public func willEnterForeground(_ handler: @escaping () -> Void) -> Self {
        _willEnterForeground = handler
        return self
    }
}
