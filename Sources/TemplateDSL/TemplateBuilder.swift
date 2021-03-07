@_functionBuilder
public enum TemplateBuilder {
    public static func buildBlock() -> [Template] {
        return []
    }
    
    public static func buildBlock(_ templates: Template...) -> [Template] {
        return templates
    }
}
