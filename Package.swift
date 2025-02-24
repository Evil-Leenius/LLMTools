
// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "LLMTools",
    platforms: [
        .macOS(.v12),
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "LLMTools",
            targets: ["LLMTools"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/ml-explore/mlx-swift.git", from: "0.21.3")
    ],
    targets: [
        .target(
            name: "LLMTools",
            dependencies: [
                .product(name: "MLX", package: "mlx-swift")
            ],
            path: "Sources/LLMTools"
        ),
        .testTarget(
            name: "LLMToolsTests",
            dependencies: ["LLMTools"],
            path: "Tests/LLMToolsTests"
        )
    ]
)
