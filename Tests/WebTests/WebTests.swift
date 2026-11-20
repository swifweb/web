import XCTest
@testable import Web

final class WebFoundationRemovalRegressionTests: XCTestCase {
    func testColorHexVectors() {
        let vectors: [(Int, String)] = [
            (0, "#00"),
            (1, "#01"),
            (15, "#0F"),
            (16, "#10"),
            (255, "#FF"),
            (0x1234, "#1234"),
            (0x12345, "#012345"),
            (0x123456, "#123456"),
            (0x1234567, "#01234567"),
            (0x12345678, "#12345678"),
        ]

        for (input, expected) in vectors {
            XCTAssertEqual(ColorType.hex(input).value, expected)
        }
    }

    func testFormURLEncoding() throws {
        XCTAssertEqual(try "AZaz09*-._".urlEncoded(), "AZaz09*-._")
        XCTAssertEqual(try "a b".urlEncoded(), "a+b")
        XCTAssertEqual(try ":/?".urlEncoded(), "%3A%2F%3F")
        XCTAssertEqual(try "é".urlEncoded(), "%C3%A9")
    }

    func testGenericPercentDecoding() {
        XCTAssertEqual(percentDecode("%41%42"), "AB")
        XCTAssertEqual(percentDecode("%4a%4B"), "JK")
        XCTAssertEqual(percentDecode("a+b"), "a+b")
        XCTAssertNil(percentDecode("%"))
        XCTAssertNil(percentDecode("%G0"))
        XCTAssertNil(percentDecode("%FF"))
    }

    func testParserFormPlusSemantics() throws {
        let plusAsSpace = try URLEncodedFormParser().parse("value=a+b")
        XCTAssertEqual(try plusAsSpace.children["value"]?.values.first?.asUrlDecoded(), "a b")

        let encodedPlus = try URLEncodedFormParser().parse("value=a%2Bb")
        XCTAssertEqual(try encodedPlus.children["value"]?.values.first?.asUrlDecoded(), "a+b")
    }
}
