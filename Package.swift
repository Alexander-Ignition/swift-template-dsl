// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swift-template-dsl",
    platforms: [
        .macOS(.v10_15),
    ],
    products: [
        .library(
            name: "TemplateDSL",
            targets: ["TemplateDSL"]),
        .library(
            name: "TemplateExample",
            targets: ["TemplateExample"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "TemplateDSL",
            dependencies: []),
        .testTarget(
            name: "TemplateDSLTests",
            dependencies: ["TemplateDSL"]),

        .target(
            name: "TemplateExample",
            dependencies: ["TemplateDSL"]),
    ]
)
