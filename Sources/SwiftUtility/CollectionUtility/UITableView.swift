//
//  File.swift
//  
//
//  Created by Phat Pham on 23/07/2021.
//

import UIKit

extension UITableView {
    convenience public init(_ contentInset: UIEdgeInsets, _ accessibilityIdentifier: String = "") {
        self.init()
        self.accessibilityIdentifier = accessibilityIdentifier
        self.backgroundColor = .white
        self.separatorStyle = .none
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
        self.contentInset = contentInset
    }
    
    /// Register a non Xib cell
    public func register(_ classType: UITableViewCell.Type) {
        let className = String(describing: classType.self)
        self.register(classType, forCellReuseIdentifier: className)
    }
    
    /// Register a xib cell
    public func registerXibCell(_ classType: UITableViewCell.Type) {
        let className = String(describing: classType.self)
        let nib = UINib(nibName: className, bundle: nil)
        self.register(nib, forCellReuseIdentifier: className)
    }
    public func dequeueCell<T: UITableViewCell>(_ classType: T.Type, indexPath: IndexPath) -> T {
        let className = String(describing: classType.self)
        guard let cell = self.dequeueReusableCell(withIdentifier: className, for: indexPath) as? T
        else { fatalError("Can't dequeue \(className) cell") }
        return cell
    }
    
    //Register header footer view
    public func registerHeaderFooterView<T: UITableViewHeaderFooterView>(_ classType: T.Type) {
        let className = String(describing: classType.self)
        self.register(classType.self, forHeaderFooterViewReuseIdentifier: className)
    }
    public func dequeueHeaderFooterView<T: UITableViewHeaderFooterView>(_ classType: T.Type) -> T {
        let className = String(describing: classType.self)
        guard let view = self.dequeueReusableHeaderFooterView(withIdentifier: className) as? T
        else {  fatalError("Can't dequeue \(className) view") }
        return view
    }
}

//Appearance
extension UITableView {
    public func updateHeaderFooterViewHeight(isHeader: Bool) {
        let targetView = isHeader ? self.tableHeaderView : self.tableFooterView
        if let targetView = targetView {
            let newSize = targetView.systemLayoutSizeFitting(CGSize(width: self.bounds.width, height: 0))
            targetView.frame.size.height = newSize.height
        }
    }
}
