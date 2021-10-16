//
//  File.swift
//  
//
//  Created by Phat Pham on 15/10/2021.
//

import UIKit

public enum AttributeTextConfig {
    case foregroundColor(_ color: UIColor)
    case backgroundColor(_ color: UIColor)
    case font(_ font: UIFont)
    case underlineStyle(_ style: NSUnderlineStyle)
    case underlineColor(_ color: UIColor)
    case strokeColor(_ color: UIColor)
    case strokeWidth(_ value: CGFloat)
    case strikethrough
    case custom(_ value: [NSAttributedString.Key: Any])
}

extension String {
    public func attribute(_ configs: [AttributeTextConfig]) -> NSAttributedString {
        let attribute = configs.attributeDictionary
        return NSAttributedString(string: self, attributes: attribute)
    }
    public func attribute(cfs: AttributeTextConfig...) -> NSAttributedString {
        return attribute(cfs)
    }
}

extension Array where Array.Element == AttributeTextConfig {
    public var attributeDictionary: [NSAttributedString.Key: Any] {
        return self.reduce([NSAttributedString.Key: Any]()) { pre, item in
            var newAttribute = pre
            switch item {
            case .backgroundColor(let color):
                newAttribute[NSAttributedString.Key.backgroundColor] = color
            case .foregroundColor(let color):
                newAttribute[NSAttributedString.Key.foregroundColor] = color
            case .font(let font):
                newAttribute[NSAttributedString.Key.font] = font
            case .underlineStyle(let style):
                newAttribute[NSAttributedString.Key.underlineStyle] = style.rawValue
            case .underlineColor(let color):
                newAttribute[NSAttributedString.Key.underlineColor] = color
            case .strokeColor(let color):
                newAttribute[NSAttributedString.Key.strokeColor] = color
            case .strokeWidth(let value):
                newAttribute[NSAttributedString.Key.strokeWidth] = value
            case .strikethrough:
                newAttribute[NSAttributedString.Key.strikethroughStyle] = NSUnderlineStyle.single.rawValue
            case .custom(let value):
                value.forEach { (key, val) in newAttribute[key] = val }
            }
            return newAttribute
        }
    }
}

extension NSAttributedString {
    static public func +(lhs: NSAttributedString, rhs: NSAttributedString) -> NSMutableAttributedString {
        
        let attributeText = NSMutableAttributedString(attributedString: lhs)
        attributeText.append(rhs)
        return attributeText
    }
    static public func +=(lhs: inout NSAttributedString, rhs: NSAttributedString) {
        lhs = lhs + rhs
    }
    static public func +=(lhs: inout NSAttributedString, rhs: String) {
        lhs = lhs + NSAttributedString(string: rhs)
    }
    static public func +(lhs: String, rhs: NSAttributedString) -> NSMutableAttributedString {
        return NSAttributedString(string: lhs) + rhs
    }
}

extension NSAttributedString {
    ///Apply attribute configs for specific text occur in string
    @discardableResult
    public func specialAttribute(forStrings dict: [String: [AttributeTextConfig]]) -> NSAttributedString {
        let self_mutation = NSMutableAttributedString(attributedString: self)
        for (key, val) in dict {
            let text = self_mutation.string
            let ranges = text.nsranges(of: key)
            ranges.forEach {
                self_mutation.setAttributes(val.attributeDictionary, range: $0)
            }
        }
        return self_mutation
    }
    static public func lineSpace(_ size: CGFloat) -> NSAttributedString {
        return "\n".attribute([.font(.systemFont(ofSize: size))])
    }
}

extension String {
    func nsranges(of substring: String, options: CompareOptions = [], locale: Locale? = nil) -> [NSRange] {
        return self.ranges(of: substring).map { NSRange($0, in: self) }
    }
    func ranges(of substring: String, options: CompareOptions = [], locale: Locale? = nil) -> [Range<Index>] {
        var ranges: [Range<Index>] = []
        while let range = range(of: substring, options: options, range: (ranges.last?.upperBound ?? self.startIndex)..<self.endIndex, locale: locale) {
            ranges.append(range)
        }
        return ranges
    }
}
