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
            self._size = $0.value.doubleValue
            self._unit = $0.unit
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
        size.listen { self._size = $0 }
    }

    public init (_ size: Double, _ unit: State<Unit>) {
        _size = size
        _unit = unit.wrappedValue
        super.init()
        unit.listen { self._unit = $0 }
    }

    public init (_ size: State<Double>, _ unit: State<Unit>) {
        _size = size.wrappedValue
        _unit = unit.wrappedValue
        super.init()
        size.listen { self._size = $0 }
        unit.listen { self._unit = $0 }
    }
    
    public required init() {
        super.init()
    }
    
    public override func buildUI() {
        super.buildUI()
        width(_size, _unit).height(_size, _unit)
    }
}
