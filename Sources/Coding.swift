//
//  Coding.swift
//  Base58 Encoding & Decoding Protocols
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

/// Base58+ Encoding Protocol
public protocol Base58PlusEncoding {
    /// Encode Data to Base58+ String
    /// - Parameter data: Input Data bytes
    /// - Returns: Base58+ Encoded String
    static func encode(_ data: Data) -> String
    
    /// Encode String to Base58+ String
    /// - Parameter data: Input String
    /// - Returns: Base58+ Encoded String
    static func encode(_ string: String) -> String
}

/// Base58+ Decoding Protocol
public protocol Base58PlusDecoding {
    /// Decode a Base58+ String to Data
    /// - Parameter string: Input Base58+ encoded string
    /// - Returns: Decoded bytes
    static func decode(_ string: String) throws -> Data
    
    /// Decode a Base58+ String to String
    /// - Parameter string: Input Base58+ encoded string
    /// - Returns: Decoded String
    static func decode(_ string: String) throws -> String
}

/// Base58+ Coding Protocol
public typealias Base58PlusCoding = Base58PlusEncoding & Base58PlusDecoding
