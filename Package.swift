// swift-tools-version:5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
import Foundation

let version = "11.0.0-rc.1"
let checksum = "38937e85667c090c486cae76f20ee37c16435fb21d2f0af1c54079f55e26ca5c"

let package = Package(
    name: "MapboxCoreMaps",
    platforms: [.iOS(.v10), .macOS(.v10_15)],
    products: [
        .library(
            name: "MapboxCoreMaps",
            targets: ["MapboxCoreMapsWrapper"]),
    ],
    dependencies: [
        .package(url: "https://github.com/kried/mapbox-common-ios.git", revision: "df75e5eec9c60db7980da7379dd20a25bca2a315"),
    ],
    targets: [
        .target(
            name: "MapboxCoreMapsWrapper",
            dependencies: [
                .product(name: "MapboxCommon", package: "mapbox-common-ios"), 
                "MapboxCoreMaps"
            ]
        ),
        .binaryTarget(
            name: "MapboxCoreMaps",
            url: "https://api.mapbox.com/downloads/v2/mobile-maps-core/releases/ios/packages/\(version)/MapboxCoreMaps.xcframework-dynamic.zip",
            checksum: checksum
        )
    ]
)
