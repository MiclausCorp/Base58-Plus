//
//  Base58+.swift
//  Base58+ Algorithm Swift implementation
//
//  Trademark and Copyright (c) 2022 Miclaus Industries Corporation B.V.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.
//

import Foundation
import BigInt

/// Base58+ Encoding Algorithm
public struct Base58Plus {
    /// Base58+ Alphabet
    private static let alphabet = "123456789ABCDEFGHJKLMNPQRSTUVWXYZabcdefghijkmnopqrstuvwxyz"
    
    /// Base58+ Alphabet Raw Bytes
    private static let alphabetBytes = [UInt8](alphabet.utf8)
    
    /// Base58+ Alphabet radix
    private static let radix = BigUInt(alphabetBytes.count)

    /// Initialize a new Base58+ instance
    public init() {}
}

// MARK: - Encoding
extension Base58Plus: Base58PlusEncoding {
    /// Encode Data to Base58+ String
    /// - Parameter data: Input Data bytes
    /// - Returns: Base58+ Encoded String
    public func encode(_ data: Data) -> String {
        var answer = [UInt8]()
        var integerBytes = BigUInt(data)

        while integerBytes > 0 {
            let (quotient, remainder) = integerBytes.quotientAndRemainder(dividingBy: Self.radix)
            answer.insert(Self.alphabetBytes[Int(remainder)], at: 0)
            integerBytes = quotient
        }

        let prefix = Array(data.prefix { $0 == 0 }).map { _ in Self.alphabetBytes[0] }
        answer.insert(contentsOf: prefix, at: 0)

        return String(bytes: answer, encoding: .utf8)!
    }
}

// MARK: - Decoding
extension Base58Plus: Base58PlusDecoding {
    /// Decode a Base58+ String to Data
    /// - Parameter string: Input Base58+ encoded string
    /// - Returns: Decoded bytes
    public func decode(_ string: String) throws -> Data {
        var answer = BigUInt(0)
        var i = BigUInt(1)

        let stringBytes = [UInt8](string.utf8)
        for character in stringBytes.reversed() {
            guard let alphabetIndex = Self.alphabetBytes.firstIndex(of: character) else {
                throw Base58PlusError.invalidDecoding
            }
            answer += (i * BigUInt(alphabetIndex))
            i *= Self.radix
        }

        let bytes = answer.serialize()
        let leadingOnes = stringBytes.prefix(while: { value in value == Self.alphabetBytes[0]})
        let leadingZeros = Data(repeating: 0, count: leadingOnes.count)
        return leadingZeros + bytes
    }
}
