//
//  StateChangeable.swift
//  
//
//  Created by Mihael Isaev on 16.11.2020.
//

protocol StateChangeableObserver {
    func setupStateChangeable()
}

protocol StateChangeable: class, Copyable {
    var states: [AnyState] { get }
    var prevSelf: Self { get set }
    var manualUpdating: Bool { get set }
    
    var changed: (Self, Self) -> Void { get set }
}

extension StateChangeable {
    func listenStates() {
        states.forEach { [self] in $0.listen(_handleChange) }
    }
    
    func manualUpdateStarted() {
        manualUpdating = true
    }
    
    func manualUpdateFinished() {
        manualUpdating = false
        _handleChange()
    }
    
    private func _handleChange() {
        guard !manualUpdating else { return }
        changed(prevSelf, self)
        prevSelf = self.copy
    }
}
