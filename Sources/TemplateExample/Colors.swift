import TemplateDSL

struct Colors: Template {
    let names: [String]
    
    var body: [Template] {
        """
        //
        //  Colors.swift
        //
        //
        //  Created by code-gen-tool
        //

        import UIKit

        """ as TemplateText

        СurlyBraces("extension UIColor") {
            EmptyLine()
            ForEach(names) { name in
                СurlyBraces("public static var \(name): UIColor") {
                    Text("return UIColor(named: #function)")
                }
                EmptyLine()
            }
        }
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct Colors_Previews: PreviewProvider {
    private static let string = Colors(names: [
        "red2",
        "blue3",
        "yellow4"
    ]).render()
    
    static var previews: some View {
        TextField("None", text: .constant(string))
            .font(.system(size: 12, weight: .regular, design: .monospaced))
            .padding()
    }
}
#endif
