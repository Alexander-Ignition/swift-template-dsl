import XCTest
import TemplateDSL

final class IndentTests: XCTestCase {

    struct Page: Template {
        var body: [Template] {
            TemplateText("Header")
            Indent {
                TemplateText("1.0")
                Indent {
                    TemplateText("1.1")
                    TemplateText("1.2")
                }
                TemplateText("2.0")
                TemplateText("3.0")
            }
            TemplateText("Footer", endLine: false)
        }
    }

    func testRender() {
        XCTAssertEqual(Page().render(), """
        Header
            1.0
                1.1
                1.2
            2.0
            3.0
        Footer
        """)
    }
}
