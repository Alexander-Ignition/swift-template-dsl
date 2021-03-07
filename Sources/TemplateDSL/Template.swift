public protocol TemplateAliases {
    typealias Text = TemplateText
    typealias ForEach = TemplateForEach
}

public protocol Template: TemplateAliases {
    @TemplateBuilder
    var body: [Template] { get }
    
    func write<T>(to stream: T) where T: TemplateStream
}

extension Template {
    public func write<T>(to stream: T) where T: TemplateStream {
        body.forEach { $0.write(to: stream) }
    }

    public func render(format: TemplateFormat = TemplateFormat()) -> String {
        let buffer = TemplateStreams.Buffer(format: format)
        write(to: buffer)
        return buffer.string
    }
}
