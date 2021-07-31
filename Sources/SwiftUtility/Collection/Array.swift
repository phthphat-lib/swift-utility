//
//  File.swift
//  File
//
//  Created by Phat Pham on 27/07/2021.
//

import Foundation

extension Array {
    public func at(_ index: Int) -> Element? {
        guard index >= 0 && index < self.count
        else { return nil }
        return self[index]
    }
}

extension Encodable {
    var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
}
