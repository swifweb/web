open class VStack: Div {
    public override func buildUI() {
        super.buildUI()
        display(.flex)
        justifyContent(.spaceBetween)
        alignItems(.stretch)
        flexDirection(.column)
    }
}
