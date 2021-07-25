//
//  File.swift
//  
//
//  Created by Phat Pham on 03/07/2021.
//

import Foundation

@propertyWrapper
public struct Missable<T>: CustomStringConvertible {
    
    public var wrappedValue: T
    
    public init(wrappedValue: T) {
        self.wrappedValue = wrappedValue
    }
    
    public var description: String {
        return String(describing: wrappedValue)
    }
}

extension Missable: Decodable where T: DefaultDecodable {
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        wrappedValue = (try? container.decode(T.self)) ?? .defaultDecodeValue
    }
}

extension Missable: Encodable where T: Encodable {
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        let optionalWrapVal = wrappedValue as Optional<T>
        switch optionalWrapVal {
        case .some(let value): try container.encode(value)
        case .none: try container.encodeNil()
        }
    }
}
extension Missable: Equatable where T: Equatable {}
extension Missable: Hashable where T: Hashable {}

extension KeyedDecodingContainer {
    public func decode<T: DefaultDecodable>(_ type: Missable<T>.Type,
                             forKey key: Key) throws -> Missable<T> {
        return ( try? decodeIfPresent(type, forKey: key) ) ?? .init(wrappedValue: .defaultDecodeValue)
    }
}
