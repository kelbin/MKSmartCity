//
//  Helper.swift
//  MCHSmartCity
//
//  Created by Nikita Nagornov on 15.07.2022.
//

import Foundation
import UIKit

extension Date {
    func getNameWeekDay() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EE"
        dateFormatter.locale = Locale(identifier: "ru")
        let weekDay = dateFormatter.string(from: self)
        return weekDay
    }
}

extension Date {
    static var currentTimeStamp: Int {
        return Int(Date().timeIntervalSince1970 * 1000)
    }
}

extension Date {
    func get(_ components: Calendar.Component..., calendar: Calendar = Calendar.current) -> DateComponents {
        return calendar.dateComponents(Set(components), from: self)
    }

    func get(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> Int {
        return calendar.component(component, from: self)
    }
}

extension Date {
    func add(minutes: Int) -> Date {
        return Calendar(identifier: .gregorian).date(byAdding: .minute, value: minutes, to: self)!
    }
    
    func addSecond(sec: Int) -> Date {
        return Calendar(identifier: .gregorian).date(byAdding: .second, value: sec, to: self)!
    }
}

extension UIColor {
    static func hexToUIColor(_ hex: String, _ alpha: CGFloat = 1.0) -> UIColor {
        var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if cString.hasPrefix("#") { cString.remove(at: cString.startIndex) }
        if (cString.count) != 6 { return UIColor.gray }
        var rgbValue: UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(alpha)
        )
    }
    
    static func hexToCGColor(_ hex: String, _ alpha: CGFloat = 1.0) -> CGColor {
        return hexToUIColor(hex, alpha).cgColor
    }
}
