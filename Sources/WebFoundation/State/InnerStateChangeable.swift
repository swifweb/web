//
//  InnerStateChangeable.swift
//  WebFoundation
//
//  Created by Mihael Isaev on 16.11.2020.
//

public protocol InnerStateChangeableObserver {
    func innerStateChangeableSetup()
}

public protocol InnerStateChangeable: class, Copyable {
    var innerStates: [AnyState] { get }
    var innerStatePrevSelf: Self { get set }
    var innerStateManualUpdating: Bool { get set }
    
    var innerStateChanged: (Self, Self) -> Void { get set }
}

extension InnerStateChangeable {
    public func innerStatesListen() {
        innerStates.forEach { [self] in $0.listen(_handleChange) }
    }
    
    public func innerStatesManualUpdateStarted() {
        innerStateManualUpdating = true
    }
    
    public func innerStatesManualUpdateFinished() {
        innerStateManualUpdating = false
        _handleChange()
    }
    
    private func _handleChange() {
        guard !innerStateManualUpdating else { return }
        innerStateChanged(innerStatePrevSelf, self)
        innerStatePrevSelf = self.copy
    }
}
