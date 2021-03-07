public struct EmptyLine: Template {
    public var body: [Template] { return [] }
    public let count: Int
    
    public init(count: Int = 1) {
        precondition(count > 0)
        self.count = count
    }
    
    public func write<T>(to stream: T) where T: TemplateStream {
        for _ in (0..<count) {
            stream.write(stream.format.newLine)
        }
    }
}
