//
//  BaseActiveElement.swift
//  
//
//  Created by Mihael Isaev on 18.12.2020.
//

import Foundation
import JavaScriptKit

open class BaseActiveElement: BaseElement, _BlurHandleable, _ClickHandleable, _DblClickHandleable, _FocusHandleable, _FocusInHandleable, _FocusOutHandleable, _KeyDownHandleable, _KeyPressHandleable, _KeyUpHandleable, _MouseDownHandleable, _MouseEnterHandleable, _MouseLeaveHandleable, _MouseMoveHandleable, _MouseOverHandleable, _MouseOutHandleable, _MouseUpHandleable {
    var blurClosure: BlurClosure?
    var blurHandler: (FocusEvent) -> Void = { _ in }
    
    var clickClosure: ClickClosure?
    var clickHandler: (MouseEvent) -> Void = { _ in }
    
    var dblClickClosure: DblClickClosure?
    var dblClickHandler: (MouseEvent) -> Void = { _ in }
    
    var focusClosure: FocusClosure?
    var focusHandler: (FocusEvent) -> Void = { _ in }
    
    var focusInClosure: FocusInClosure?
    var focusInHandler: (FocusEvent) -> Void = { _ in }
    
    var focusOutClosure: FocusOutClosure?
    var focusOutHandler: (FocusEvent) -> Void = { _ in }
    
    var keyDownClosure: KeyDownClosure?
    var keyDownHandler: (KeyboardEvent) -> Void = { _ in }
    
    var keyPressClosure: KeyPressClosure?
    var keyPressHandler: (KeyboardEvent) -> Void = { _ in }
    
    var keyUpClosure: KeyUpClosure?
    var keyUpHandler: (KeyboardEvent) -> Void = { _ in }
    
    var mouseDownClosure: MouseDownClosure?
    var mouseDownHandler: (MouseEvent) -> Void = { _ in }
    
    var mouseEnterClosure: MouseEnterClosure?
    var mouseEnterHandler: (MouseEvent) -> Void = { _ in }
    
    var mouseLeaveClosure: MouseLeaveClosure?
    var mouseLeaveHandler: (MouseEvent) -> Void = { _ in }
    
    var mouseMoveClosure: MouseMoveClosure?
    var mouseMoveHandler: (MouseEvent) -> Void = { _ in }
    
    var mouseOverClosure: MouseOverClosure?
    var mouseOverHandler: (MouseEvent) -> Void = { _ in }
    
    var mouseOutClosure: MouseOutClosure?
    var mouseOutHandler: (MouseEvent) -> Void = { _ in }
    
    var mouseUpClosure: MouseUpClosure?
    var mouseUpHandler: (MouseEvent) -> Void = { _ in }
    
    deinit {
        blurClosure?.release()
        clickClosure?.release()
        dblClickClosure?.release()
        focusClosure?.release()
        focusInClosure?.release()
        focusOutClosure?.release()
        keyDownClosure?.release()
        keyPressClosure?.release()
        keyUpClosure?.release()
        mouseDownClosure?.release()
        mouseEnterClosure?.release()
        mouseLeaveClosure?.release()
        mouseMoveClosure?.release()
        mouseOverClosure?.release()
        mouseOutClosure?.release()
        mouseUpClosure?.release()
    }
}
