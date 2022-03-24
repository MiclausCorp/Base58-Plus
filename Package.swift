// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

/// Base58+ Package
let package = Package(
    /// Package Name
    name: "Base58-Plus",
    
    /// Package Products
    /// Products define the executables and libraries a package produces, and make them visible to other packages.
    products: [
        .library(
            name: "Base58-Plus",
            targets: ["Base58-Plus"]),
    ],
    /// Product Dependencies
    /// Dependencies declare other packages that this package depends on.
    dependencies: [
        .package(url: "https://github.com/attaswift/BigInt.git", from: "5.3.0")
    ],
    
    /// Package Targets
    /// Targets are the basic building blocks of a package. A target can define a module or a test suite.
    /// Targets can depend on other targets in this package, and on products in packages this package depends on.
    targets: [
        /// Main library
        .target(
            name: "Base58-Plus",
            dependencies: ["BigInt"],
            path: "./Sources/"
        ),
        
        /// Unit tests
        .testTarget(
            name: "Tests",
            dependencies: ["Base58-Plus"],
            path: "./Tests/")
    ]
)
