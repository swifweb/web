//
//  Scopes.swift
//  DOMEvents
//
//  Created by Mihael Isaev on 25.02.2021.
//

public protocol DOMEventsBaseScope:
    AnimationEndHandleable,
    AnimationIterationHandleable,
    AnimationStartHandleable,
    ContextMenuHandleable,
    CopyHandleable,
    CutHandleable,
    DragHandleable,
    DragEndHandleable,
    DragEnterHandleable,
    DragLeaveHandleable,
    DragOverHandleable,
    DragStartHandleable,
    DropHandleable,
    FullScreenChangeHandleable,
    FullScreenErrorHandleable,
    MessageHandleable,
    OpenHandleable,
    PasteHandleable,
    TouchCancelHandleable,
    TouchEndHandleable,
    TouchMoveHandleable,
    TouchStartHandleable,
    TransitionEndHandleable,
    WheelHandleable
{}

public protocol DOMEventsActiveScope: DOMEventsBaseScope,
    BlurHandleable,
    ClickHandleable,
    DblClickHandleable,
    FocusHandleable,
    FocusInHandleable,
    FocusOutHandleable,
    KeyDownHandleable,
    KeyPressHandleable,
    KeyUpHandleable,
    MouseDownHandleable,
    MouseEnterHandleable,
    MouseLeaveHandleable,
    MouseMoveHandleable,
    MouseOverHandleable,
    MouseOutHandleable,
    MouseUpHandleable
{}
