import Foundation

public struct TemplateFormat: Equatable, Codable {
    public var newLine: String
    public var indent: String
    
    public init(
        newLine: String = "\n",
        indent: String = "    "
    ) {
        self.newLine = newLine
        self.indent = indent
    }
}

public protocol TemplateStream {
    var format: TemplateFormat { get }
    
    func write(_ string: String)
}

public enum TemplateStreams {
    public final class Buffer: TemplateStream {
        private var text: [String] = []
        
        public var string: String { text.joined() }
        
        public let format: TemplateFormat
        
        init(format: TemplateFormat = TemplateFormat()) {
            self.format = format
        }
        
        public func write(_ string: String) {
            text.append(string)
        }
    }
}
