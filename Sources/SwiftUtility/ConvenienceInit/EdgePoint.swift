//
//  File.swift
//  
//
//  Created by Phat Pham on 15/10/2021.
//

import UIKit

extension CGPoint {
    public init(_ x: CGFloat, _ y: CGFloat) {
        self.init(x: x, y: y)
    }
    static public func equalXY(_ value: CGFloat) -> CGPoint {
        return CGPoint.init(x: value, y: value)
    }
}
