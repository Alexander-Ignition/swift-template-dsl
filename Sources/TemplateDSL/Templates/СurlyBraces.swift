public struct СurlyBraces: Template {
    public let head: String
    public let content: [Template]

    public init(_ head: String, @TemplateBuilder content: () -> [Template]) {
        self.head = head
        self.content = content()
    }

    public var body: [Template] {
        Text("\(head) {")
        Indent(content)
        Text("}")
    }
}
