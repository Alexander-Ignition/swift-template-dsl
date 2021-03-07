import XCTest
import TemplateDSL

final class TemplateTextTests: XCTestCase {
    
    func testStringLiteral() {
        let text: TemplateText = "any content"
        XCTAssertEqual(text.render(), "any content\n")
    }
    
    func testStringInterpolation() {
        let text: TemplateText = "Count: \(200)"
        XCTAssertEqual(text.render(), "Count: 200\n")
    }

    func testDescription() {
        let string = String(describing: TemplateText("hello"))
        XCTAssertEqual(string, "hello")
    }

    func testDebugDescription() {
        let string = String(reflecting: TemplateText("x"))
        XCTAssertEqual(string, "TemplateText(value: \"x\", endLine: true)")
    }
}
