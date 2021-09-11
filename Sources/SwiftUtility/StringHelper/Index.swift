//
//  File.swift
//  File
//
//  Created by Phat Pham on 16/08/2021.
//

import Foundation

extension StringProtocol {
    public subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}
