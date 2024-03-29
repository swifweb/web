//
//  Names.swift
//  Events
//
//  Created by Mihael Isaev on 28.02.2021.
//

import Foundation

/// [Learn more](https://developer.mozilla.org/en-US/docs/Web/Events)
public struct EventName: ExpressibleByStringLiteral, Hashable {
    let value: String
    
    public init(stringLiteral value: StringLiteralType) {
        self.value = value
    }

    public static var abort: Self { "abort" }
    public static var activate: Self { "activate" }
    public static var addStream: Self { "addstream" }
    public static var addTrack: Self { "addtrack" }
    public static var afterPrint: Self { "afterprint" }
    public static var afterScriptExecute: Self { "afterscriptexecute" }
    public static var animationCancel: Self { "animationcancel" }
    public static var animationEnd: Self { "animationend" }
    public static var animationIteration: Self { "animationiteration" }
    public static var animationStart: Self { "animationstart" }
    public static var appInstalled: Self { "appinstalled" }
    public static var audioEnd: Self { "audioend" }
    public static var audioProcess: Self { "audioprocess" }
    public static var audioStart: Self { "audiostart" }
    public static var auxClick: Self { "auxclick" }
    public static var beforeInput: Self { "beforeinput" }
    public static var beforePrint: Self { "beforeprint" }
    public static var beforeScriptExecute: Self { "beforescriptexecute" }
    public static var beforeUnload: Self { "beforeunload" }
    public static var beginEvent: Self { "beginEvent" }
    public static var blocked: Self { "blocked" }
    public static var blur: Self { "blur" }
    public static var boundary: Self { "boundary" }
    public static var bufferedAmountLow: Self { "bufferedamountlow" }
    public static var cancel: Self { "cancel" }
    public static var canPlay: Self { "canplay" }
    public static var canPlayThrough: Self { "canplaythrough" }
    public static var change: Self { "change" }
    public static var click: Self { "click" }
    public static var close: Self { "close" }
    public static var closing: Self { "closing" }
    public static var compositionEnd: Self { "compositionend" }
    public static var compositionStart: Self { "compositionstart" }
    public static var compositionUpdate: Self { "compositionupdate" }
    public static var connect: Self { "connect" }
    public static var connectionStateChange: Self { "connectionstatechange" }
    public static var contentDelete: Self { "contentdelete" }
    public static var contextMenu: Self { "contextmenu" }
    public static var copy: Self { "copy" }
    public static var cueChange: Self { "cuechange" }
    public static var cut: Self { "cut" }
    public static var domActivate: Self { "DOMActivate" }
    public static var domContentLoaded: Self { "DOMContentLoaded" }
    public static var domMouseScroll: Self { "DOMMouseScroll" }
    public static var dataChannel: Self { "datachannel" }
    public static var dblClick: Self { "dblclick" }
    public static var deviceChange: Self { "devicechange" }
    public static var deviceMotion: Self { "devicemotion" }
    public static var deviceOrientation: Self { "deviceorientation" }
    public static var drag: Self { "drag" }
    public static var dragEnd: Self { "dragend" }
    public static var dragEnter: Self { "dragenter" }
    public static var dragLeave: Self { "dragleave" }
    public static var dragOver: Self { "dragover" }
    public static var dragStart: Self { "dragstart" }
    public static var drop: Self { "drop" }
    public static var durationChange: Self { "durationchange" }
    public static var emptied: Self { "emptied" }
    public static var end: Self { "end" }
    public static var endEvent: Self { "endEvent" }
    public static var ended: Self { "ended" }
    public static var enterPictureInPicture: Self { "enterpictureinpicture" }
    public static var error: Self { "error" }
    public static var focus: Self { "focus" }
    public static var focusIn: Self { "focusin" }
    public static var focusOut: Self { "focusout" }
    public static var formData: Self { "formdata" }
    public static var fullscreenChange: Self { "fullscreenchange" }
    public static var fullcreenError: Self { "fullscreenerror" }
    public static var gamepadConnected: Self { "gamepadconnected" }
    public static var gamepadDisconnected: Self { "gamepaddisconnected" }
    public static var gatheringStateChange: Self { "gatheringstatechange" }
    public static var gestureChange: Self { "gesturechange" }
    public static var gestureEnd: Self { "gestureend" }
    public static var gestureStart: Self { "gesturestart" }
    public static var gotPointerCapture: Self { "gotpointercapture" }
    public static var hashChange: Self { "hashchange" }
    public static var iceCandidate: Self { "icecandidate" }
    public static var iceCandidateError: Self { "icecandidateerror" }
    public static var iceConnectionStateChange: Self { "iceconnectionstatechange" }
    public static var iceGatheringStateChange: Self { "icegatheringstatechange" }
    public static var identityResult: Self { "identityresult" }
    public static var idpAssertionError: Self { "idpassertionerror" }
    public static var idpValidationError: Self { "idpvalidationerror" }
    public static var input: Self { "input" }
    public static var inputSourcesChange: Self { "inputsourceschange" }
    public static var install: Self { "install" }
    public static var invalid: Self { "invalid" }
    public static var keyDown: Self { "keydown" }
    public static var keyPress: Self { "keypress" }
    public static var keyUp: Self { "keyup" }
    public static var languageChange: Self { "languagechange" }
    public static var leavePictureInPicture: Self { "leavepictureinpicture" }
    public static var load: Self { "load" }
    public static var loadedData: Self { "loadeddata" }
    public static var loadedMetadata: Self { "loadedmetadata" }
    public static var loadEnd: Self { "loadend" }
    public static var loadStart: Self { "loadstart" }
    public static var lostPointerCapture: Self { "lostpointercapture" }
    public static var msGestureChange: Self { "MSGestureChange" }
    public static var msGestureEnd: Self { "MSGestureEnd" }
    public static var msGestureHold: Self { "MSGestureHold" }
    public static var msGestureStart: Self { "MSGestureStart" }
    public static var msGestureTap: Self { "MSGestureTap" }
    public static var msInertiaStart: Self { "MSInertiaStart" }
    public static var msManipulationStateChanged: Self { "MSManipulationStateChanged" }
    public static var mark: Self { "mark" }
    public static var merchantValidation: Self { "merchantvalidation" }
    public static var message: Self { "message" }
    public static var messageError: Self { "messageerror" }
    public static var mouseDown: Self { "mousedown" }
    public static var mouseEnter: Self { "mouseenter" }
    public static var mouseLeave: Self { "mouseleave" }
    public static var mouseMove: Self { "mousemove" }
    public static var mouseOut: Self { "mouseout" }
    public static var mouseOver: Self { "mouseover" }
    public static var mouseUp: Self { "mouseup" }
    public static var mouseWheel: Self { "mousewheel" }
    public static var msContentZoom: Self { "msContentZoom" }
    public static var mute: Self { "mute" }
    public static var negotiationNeeded: Self { "negotiationneeded" }
    public static var noMatch: Self { "nomatch" }
    public static var notificationClick: Self { "notificationclick" }
    public static var offline: Self { "offline" }
    public static var online: Self { "online" }
    public static var open: Self { "open" }
    public static var orientationChange: Self { "orientationchange" }
    public static var overflow: Self { "overflow" }
    public static var pageHide: Self { "pagehide" }
    public static var pageShow: Self { "pageshow" }
    public static var paste: Self { "paste" }
    public static var pause: Self { "pause" }
    public static var payerDetailChange: Self { "payerdetailchange" }
    public static var paymentMethodChange: Self { "paymentmethodchange" }
    public static var peerIdentity: Self { "peeridentity" }
    public static var play: Self { "play" }
    public static var playing: Self { "playing" }
    public static var pointerCancel: Self { "pointercancel" }
    public static var pointerDown: Self { "pointerdown" }
    public static var pointerEnter: Self { "pointerenter" }
    public static var pointerLeave: Self { "pointerleave" }
    public static var pointerLockChange: Self { "pointerlockchange" }
    public static var pointerLockError: Self { "pointerlockerror" }
    public static var pointerMove: Self { "pointermove" }
    public static var pointerOut: Self { "pointerout" }
    public static var pointerOver: Self { "pointerover" }
    public static var pointerUp: Self { "pointerup" }
    public static var popState: Self { "popstate" }
    public static var progress: Self { "progress" }
    public static var push: Self { "push" }
    public static var pushSubscriptionChange: Self { "pushsubscriptionchange" }
    public static var rateChange: Self { "ratechange" }
    public static var readyStateChange: Self { "readystatechange" }
    public static var rejectionHandled: Self { "rejectionhandled" }
    public static var removeTrack: Self { "removeTrack" }
    public static var removeStream: Self { "removestream" }
    public static var repeatEvent: Self { "repeatEvent" }
    public static var reset: Self { "reset" }
    public static var resize: Self { "resize" }
    public static var resourceTimingBufferFull: Self { "resourcetimingbufferfull" }
    public static var result: Self { "result" }
    public static var resume: Self { "resume" }
    public static var scroll: Self { "scroll" }
    public static var search: Self { "search" }
    public static var seeked: Self { "seeked" }
    public static var seeking: Self { "seeking" }
    public static var select: Self { "select" }
    public static var selectedCandidatePairChange: Self { "selectedcandidatepairchange" }
    public static var selectEnd: Self { "selectend" }
    public static var selectionChange: Self { "selectionchange" }
    public static var selectStart: Self { "selectstart" }
    public static var shippingAddressChange: Self { "shippingaddresschange" }
    public static var shippingOptionChange: Self { "shippingoptionchange" }
    public static var show: Self { "show" }
    public static var signalingStateChange: Self { "signalingstatechange" }
    public static var slotChange: Self { "slotchange" }
    public static var soundEnd: Self { "soundend" }
    public static var soundStart: Self { "soundstart" }
    public static var speechEnd: Self { "speechend" }
    public static var speechStart: Self { "speechstart" }
    public static var squeeze: Self { "squeeze" }
    public static var squeezeEnd: Self { "squeezeend" }
    public static var squeezeStart: Self { "squeezestart" }
    public static var stalled: Self { "stalled" }
    public static var start: Self { "start" }
    public static var stateChange: Self { "statechange" }
    public static var storage: Self { "storage" }
    public static var submit: Self { "submit" }
    public static var success: Self { "success" }
    public static var suspend: Self { "suspend" }
    public static var timeout: Self { "timeout" }
    public static var timeUpdate: Self { "timeupdate" }
    public static var toggle: Self { "toggle" }
    public static var toneChange: Self { "tonechange" }
    public static var touchCancel: Self { "touchcancel" }
    public static var touchEnd: Self { "touchend" }
    public static var touchMove: Self { "touchmove" }
    public static var touchStart: Self { "touchstart" }
    public static var track: Self { "track" }
    public static var transitionCancel: Self { "transitioncancel" }
    public static var transitionEnd: Self { "transitionend" }
    public static var transitionRun: Self { "transitionrun" }
    public static var transitionStart: Self { "transitionstart" }
    public static var underflow: Self { "underflow" }
    public static var unhandledRejection: Self { "unhandledrejection" }
    public static var unload: Self { "unload" }
    public static var unmute: Self { "unmute" }
    public static var upgradeNeeded: Self { "upgradeneeded" }
    public static var versionChange: Self { "versionchange" }
    public static var visibilityChange: Self { "visibilitychange" }
    public static var voicesChanged: Self { "voiceschanged" }
    public static var volumeChange: Self { "volumechange" }
    public static var vrDisplayActivate: Self { "vrdisplayactivate" }
    public static var vrDisplayBlur: Self { "vrdisplayblur" }
    public static var vrDisplayConnect: Self { "vrdisplayconnect" }
    public static var vrDisplayDeactivate: Self { "vrdisplaydeactivate" }
    public static var vrDisplayDisconnect: Self { "vrdisplaydisconnect" }
    public static var vrDisplayFocus: Self { "vrdisplayfocus" }
    public static var vrDisplayPointerRestricted: Self { "vrdisplaypointerrestricted" }
    public static var vrDisplayPointerUnrestricted: Self { "vrdisplaypointerunrestricted" }
    public static var vrDisplayPresentChange: Self { "vrdisplaypresentchange" }
    public static var waiting: Self { "waiting" }
    public static var webGLContextCreationError: Self { "webglcontextcreationerror" }
    public static var webGLContextLost: Self { "webglcontextlost" }
    public static var webGLContextRestored: Self { "webglcontextrestored" }
    public static var webkitMouseForceChanged: Self { "webkitmouseforcechanged" }
    public static var webkitMouseForceDown: Self { "webkitmouseforcedown" }
    public static var webkitMouseForceUp: Self { "webkitmouseforceup" }
    public static var webkitMouseForceWillBegin: Self { "webkitmouseforcewillbegin" }
    public static var wheel: Self { "wheel" }
}
