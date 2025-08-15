// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FMDB",
    platforms: [
        .iOS(.v12),
        .macOS(.v10_13),
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(name: "FMDB", targets: ["FMDB"]),
    ],
    dependencies: [
        // Add SQLCipher SPM dependency
        .package(url: "https://github.com/sqlcipher/SQLCipher.swift.git", exact: "4.10.0")
    ],
    targets: [
        .target(
            name: "FMDB",
            dependencies: [
                .product(name: "SQLCipher", package: "SQLCipher.swift")
            ],
            path: "src/fmdb",
	    resources: [.process("../../privacy/PrivacyInfo.xcprivacy")],
            publicHeadersPath: ".",
            cSettings: [
                .define("SQLITE_HAS_CODEC"),
                .define("HAVE_USLEEP", to: "1"),
                .define("SQLCIPHER_CRYPTO")
            ]
        )
    ]
)
