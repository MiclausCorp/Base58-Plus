# Base58+

A Swift implementation of the MiclausCorp Base58+ Encoding Algorithm.

[![Build](https://github.com/MiclausCorp/Base58-Plus/actions/workflows/swift.yml/badge.svg)](https://github.com/MiclausCorp/Base58-Plus/actions/workflows/swift.yml)
[![Get on SPM](https://img.shields.io/badge/Available%20on-Swift%20Package%20Manager-orange?logo=swift)](#installation)

## Installation
#### Swift Package Manager

You can use [Swift Package Manager](https://swift.org/package-manager/) and specify dependency in `Package.swift` by adding this:
```swift
.package(url: "https://github.com/MiclausCorp/Base58-Plus.git", branch: "master")
```

## Example Usage
#### Encoding a string
```swift
let message = "Hello, World!"
let encode = Base58Plus.encode(message)

print(encode) // 72k1xXWG59fYdzSNoA
```

#### Decoding a string
```swift
let message = "72k1xXWG59fYdzSNoA"

let decode = Base58Plus.decode(message)
print(decode) // Hello, World!
```

## License
[MIT License](LICENSE)
