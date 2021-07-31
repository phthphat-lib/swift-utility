//
//  DateHelper.swift
//  Hotel
//
//  Created by phat on 25/02/2021.
//

import Foundation

extension DateFormatter {
    public convenience init(_ formatString: String) {
        self.init()
        dateFormat = formatString
    }
}

extension Date {
    public init?(_ dateString: String, format: String) {
        if let date = DateFormatter(format).date(from: dateString) {
            self = date
        } else {
            return nil
        }
    }
    
    @available(iOS 10.0, *)
    public init?(iso8601: String) {
        let formater = ISO8601DateFormatter()
        formater.formatOptions.insert(.withFullTime)
        formater.formatOptions.insert(.withTime)
        formater.formatOptions.insert(.withDashSeparatorInDate)
        formater.formatOptions.insert(.withColonSeparatorInTime)
        if #available(iOS 11.0, *) {
            formater.formatOptions.insert(.withFractionalSeconds)
        }
        if let date = formater.date(from: iso8601) {
            self = date
        } else {
            return nil
        }
    }
    
    public func string(format: String) -> String {
        return DateFormatter(format).string(from: self)
    }
    
    public func dateComponent(_ components: Set<Calendar.Component>) -> DateComponents {
        return Calendar.current.dateComponents(components, from: self)
    }
    //Date
    public var day:        Int { return dateComponent([.day]).day! }
    public var month:      Int { return dateComponent([.month]).month! }
    public var year:       Int { return dateComponent([.year]).year! }
    public var weekday:    Int { return dateComponent([.weekday]).weekday! }
    //Time
    public var hour:       Int { return dateComponent([.hour]).hour! }
    public var minute:     Int { return dateComponent([.minute]).minute! }
    public var second:     Int { return dateComponent([.second]).second! }
    public var nanosecond: Int { return dateComponent([.nanosecond]).nanosecond! }
}

extension String {
    public func date(format: String) -> Date? {
        return DateFormatter(format).date(from: self)
    }
}
