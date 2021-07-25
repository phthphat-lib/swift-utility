//
//  UIView.swift
//  
//
//  Created by Phat Pham on 23/07/2021.
//

import UIKit

extension UIView {
    convenience public init(backgroundColor: UIColor) {
        self.init(frame: .zero)
        self.backgroundColor = backgroundColor
    }
}
