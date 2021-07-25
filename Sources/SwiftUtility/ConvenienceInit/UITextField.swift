//
//  UITextField.swift
//  
//
//  Created by Phat Pham on 23/07/2021.
//

import UIKit

extension UITextField {
    convenience public init(placeholder: String, font: UIFont = .systemFont(ofSize: 13)) {
        self.init()
        self.placeholder = placeholder
        self.font = font
    }
}
