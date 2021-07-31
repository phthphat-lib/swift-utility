//
//  File.swift
//  
//
//  Created by Phat Pham on 23/07/2021.
//

import UIKit

extension UICollectionView {
    convenience public init(_ layout: UICollectionViewFlowLayout, _ accessibilityIdentifier: String = "") {
        self.init(frame: .zero, collectionViewLayout: layout)
        self.accessibilityIdentifier = accessibilityIdentifier
        self.backgroundColor = .white
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
    }
    
    public var flowLayout: UICollectionViewFlowLayout? {
        return self.collectionViewLayout as? UICollectionViewFlowLayout
    }
    
    public func register(_ classType: UICollectionViewCell.Type) {
        let className = String(describing: classType.self)
        self.register(classType, forCellWithReuseIdentifier: className)
    }
    public func registerXibCell(_ classType: UICollectionViewCell.Type) {
        let className = String(describing: classType.self)
        let nib = UINib(nibName: className, bundle: nil)
        self.register(nib, forCellWithReuseIdentifier: className)
    }
    
    public func dequeueCell<T: UICollectionViewCell>(_ classType: T.Type, indexPath: IndexPath) -> T {
        let className = String(describing: classType.self)
        return self.dequeueReusableCell(withReuseIdentifier: className, for: indexPath) as! T
    }
    
    public func registerSupplementaryViewFile<T: UICollectionViewCell>(_ type: T.Type) {
        self.register(UINib(nibName:String(describing: T.self), bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: String(describing: T.self))
    }
    
    public func dequeueSupplementaryView<T: UICollectionViewCell>(_: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: String(describing: T.self), for: indexPath) as? T
            else { fatalError("Could not dequeue cell with type \(T.self)") }
        return cell
    }
}
