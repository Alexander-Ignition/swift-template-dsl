public struct Indent: Template {
    public let body: [Template]
    
    public init(_ contents: [Template]) {
        self.body = contents
    }
    
    public init(@TemplateBuilder contents: () -> [Template]) {
        self.body = contents()
    }
    
    public func write<T>(to stream: T) where T: TemplateStream {
        let downstream = Stream(upstream: stream)
        body.forEach { $0.write(to: downstream) }
    }
    
    struct Stream<T>: TemplateStream where T: TemplateStream {
        let upstream: T
        
        var format: TemplateFormat { upstream.format }
        
        func write(_ string: String) {
            if string == format.newLine {
                upstream.write(string)
            } else {
                upstream.write("\(format.indent)\(string)")
            }
        }
    }
}
