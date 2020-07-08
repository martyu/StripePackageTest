// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Stripe",
    products: [
        .library(
            name: "Stripe",
            targets: ["Stripe"]),
		.library(
			name: "Example",
			targets: ["Example"])
    ],
    dependencies: [],
    targets: [
		// I thought this was defining the Stripe binaryTarget...
		.binaryTarget(name: "Stripe",
					  url: "https://github.com/stripe/stripe-ios/releases/download/v19.3.0/Stripe.xcframework.zip",
					  checksum: "fe459dd443beee5140018388fd6933e09b8787d5b473ec9c2234d75ff0d968bd"),
		// ... and then linking it to the Example project here via "dependencies" ...
		.target(name: "Example", dependencies: ["Stripe"])
		// ... so when I'm in "Example" files, I thought I'd be able to import "Stripe" to them
    ]
)
