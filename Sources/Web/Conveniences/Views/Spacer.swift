open class Spacer: BaseActiveElement {
    @State var _size: Double = 0
    @State var _unit: Unit = .px

    public init <U: UnitValuable>(_ value: U) {
        _size = value.value.doubleValue
        _unit = value.unit
        super.init()
    }

    public init <U: UnitValuable>(_ value: State<U>) {
        _size = value.wrappedValue.value.doubleValue
        _unit = value.wrappedValue.unit
        super.init()
        value.listen {
            let size = $0.value.doubleValue
            let unit = $0.unit.description
            Task { @MainActor in
                self._size = size
                self._unit = spacerUnit(from: unit)
            }
        }
    }
    
    public init (_ size: Double, _ unit: Unit) {
        _size = size
        _unit = unit
        super.init()
    }
    
    public init (_ size: State<Double>, _ unit: Unit) {
        _size = size.wrappedValue
        _unit = unit
        super.init()
        size.listen {
            let snapshot = $0
            Task { @MainActor in self._size = snapshot }
        }
    }

    public init (_ size: Double, _ unit: State<Unit>) {
        _size = size
        _unit = unit.wrappedValue
        super.init()
        unit.listen {
            let snapshot = $0
            Task { @MainActor in self._unit = snapshot }
        }
    }

    public init (_ size: State<Double>, _ unit: State<Unit>) {
        _size = size.wrappedValue
        _unit = unit.wrappedValue
        super.init()
        size.listen {
            let snapshot = $0
            Task { @MainActor in self._size = snapshot }
        }
        unit.listen {
            let snapshot = $0
            Task { @MainActor in self._unit = snapshot }
        }
    }
    
    public required init() {
        super.init()
    }
    
    public override func buildUI() {
        super.buildUI()
        width(_size, _unit).height(_size, _unit)
    }
}

private func spacerUnit(from snapshot: String) -> Unit {
    let importantSuffix = "!important"
    var value = snapshot
    var importantCount = 0
    while value.hasSuffix(importantSuffix) {
        value = String(value.dropLast(importantSuffix.count))
        importantCount += 1
    }
    var unit: Unit
    switch value {
    case "cm": unit = .cm
    case "mm": unit = .mm
    case "in": unit = .in
    case "px": unit = .px
    case "pt": unit = .pt
    case "pc": unit = .pc
    case "fr": unit = .fr
    case "em": unit = .em
    case "ex": unit = .ex
    case "ch": unit = .ch
    case "rem": unit = .rem
    case "vw": unit = .vw
    case "vh": unit = .vh
    case "vmin": unit = .vmin
    case "vmax": unit = .vmax
    case "%": unit = .percent
    default: preconditionFailure("Unknown Spacer unit snapshot: \(snapshot)")
    }
    for _ in 0..<importantCount {
        unit = unit.important
    }
    return unit
}
