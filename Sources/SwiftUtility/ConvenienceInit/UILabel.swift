//
//  File.swift
//  
//
//  Created by Phat Pham on 23/07/2021.
//

import UIKit

extension UILabel {
    convenience public init(text: String? = nil, font: UIFont? = .systemFont(ofSize: 13), textColor: UIColor = .black, textAlignment: NSTextAlignment = .left, numberOfLines: Int = 1) {
        self.init()
        self.text = text
        self.font = font
        self.textColor = textColor
        self.textAlignment = textAlignment
        self.numberOfLines = numberOfLines
    }
}
