public struct TemplateText: Template {
    public var body: [Template] { return [] }
    public let value: String
    public let endLine: Bool

    public init(_ value: String, endLine: Bool = true) {
        self.value = value
        self.endLine = endLine
    }

    public init(_ elements: String?..., separator: String) {
        self.value = elements.compactMap { $0 }.joined(separator: separator)
        self.endLine = true
    }

    public func write<T>(to stream: T) where T: TemplateStream {
        if endLine {
            stream.write("\(value)\(stream.format.newLine)")
        } else {
            stream.write(value)
        }
    }
}

extension TemplateText: ExpressibleByStringLiteral {
    public init(stringLiteral value: String) {
        self.init(value)
    }
}

extension TemplateText: ExpressibleByStringInterpolation {
    public init(stringInterpolation: DefaultStringInterpolation) {
        self.init(stringInterpolation.description)
    }
}

extension TemplateText: CustomStringConvertible {
    public var description: String { value }
}

extension TemplateText: CustomDebugStringConvertible {
    public var debugDescription: String {
        "TemplateText(value: \"\(value)\", endLine: \(endLine))"
    }
}
