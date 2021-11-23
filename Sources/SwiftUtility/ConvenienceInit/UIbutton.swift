//
//  File.swift
//  
//
//  Created by Phat Pham on 18/10/2021.
//

import UIKit

extension UIButton {
    public convenience init(text: String, textColor: UIColor = .systemBlue) {
        self.init(frame: .zero)
        self.setTitle(text, for: .normal)
        self.setTitleColor(textColor, for: .normal)
    }
}
