import XCTest
import TemplateDSL

final class TemplateForEachTests: XCTestCase {

    struct Page: Template {
        let items = Array(0..<3)

        var body: [Template] {
            TemplateText("Header")
            TemplateForEach(items) { item in
                TemplateText("- item: \(item)")
                TemplateText("")
            }
            TemplateText("Footer", endLine: false)
        }
    }

    func testRender() {
        XCTAssertEqual(Page().render(), """
        Header
        - item: 0

        - item: 1

        - item: 2

        Footer
        """)
    }
}

