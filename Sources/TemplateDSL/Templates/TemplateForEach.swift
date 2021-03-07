public struct TemplateForEach: Template {
    public let body: [Template]
    
    @inlinable
    public init<T>(_ items: [T], @TemplateBuilder content: (T) -> [Template]) {
        self.body = items.flatMap { content($0) }
    }
}
