open class HStack: Div {
    public override func buildUI() {
        super.buildUI()
        display(.flex)
        justifyContent(.spaceBetween)
        flexDirection(.row)
    }
}
