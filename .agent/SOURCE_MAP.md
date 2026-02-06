# Source Map

Compact navigation map for current SwifWeb source. Use it before broad discovery, then inspect only the exact target, direct dependencies/callers, and tests relevant to the task.

## Package Authority

| Path | Role |
|---|---|
| `Package.swift` | Current SwiftPM products, targets, dependencies, tools version, and target graph |
| `Sources/<Target>/` | Production source for the matching SwiftPM target |
| `Tests/WebTests/` | Focused high-level `Web` package tests |
| `Tests/ServiceWorkerTests/` | Focused ServiceWorker tests |
| `Tests/LinuxMain.swift` | Legacy Linux XCTest entrypoint |

## Core Layers

| Path | Role |
|---|---|
| `Sources/WebFoundation/` | Shared JavaScriptKit re-export, JS value conversions, bridge primitives, storage/state/base Web values |
| `Sources/Events/` | Generic event wrappers, event target/listener machinery, and event value types |
| `Sources/DOMEvents/` | DOM-specific event conveniences and handleable protocols |
| `Sources/DOM/` | Element/document/window model, HTML elements, attributes, and DOM hierarchy helpers |
| `Sources/CSS/` | Typed CSS values, properties, functions, rules, and stylesheet behavior |
| `Sources/Web/` | App builder, routing, middleware, pages/controllers, localization, forms, and preview support |

## Web API Families

- Fetch/transport/data: `Sources/FetchAPI/`, `Sources/StreamsAPI/`, `Sources/XMLHttpRequest/`, `Sources/WebSocketAPI/`, `Sources/BeaconAPI/`.
- Workers/messaging: `Sources/WorkersAPI/`, `Sources/Worker/`, `Sources/SharedWorker/`, `Sources/ServiceWorker/`, `Sources/ChannelMessagingAPI/`, `Sources/BroadcastChannelAPI/`.
- Browser globals/capabilities: `Sources/NavigatorAPI/`, `Sources/LocationAPI/`, `Sources/HistoryAPI/`, `Sources/StorageAPI/`, `Sources/NotificationsAPI/`.
- DOM-adjacent capabilities: `Sources/ResizeObserverAPI/`, `Sources/IntersectionObserverAPI/`, `Sources/FullscreenAPI/`, `Sources/PictureInPictureAPI/`, `Sources/CanvasAPI/`, `Sources/ClipboardAPI/`.
- Remaining focused targets are discoverable from `Package.swift`; do not treat this compact grouping as a replacement for the manifest.

## High-Risk Bridge Locations

- `Sources/WebFoundation/Exports.swift` — JavaScriptKit re-export boundary.
- `Sources/Events/EventListener.swift` and `Sources/ServiceWorker/EventListener.swift` — retained closure and listener removal behavior.
- `Sources/FetchAPI/` and `Sources/StreamsAPI/` — promise/callback/error and stream lifetime mappings.
- `Sources/WebSocketAPI/`, `Sources/XMLHttpRequest/`, and `Sources/ResizeObserverAPI/` — multiple retained `JSClosure` paths.
- `Sources/DOM/DOMElement.swift`, `Sources/CSS/Stylesheet.swift`, and `Sources/Web/WebApp.swift` — representative wasm/native conditional behavior.

## Never Treat as Authority

`.build/`, DerivedData, editor configuration, generated output, `.DS_Store`, user-local state, and transient `.artifacts/**` are not product or architecture authority.
