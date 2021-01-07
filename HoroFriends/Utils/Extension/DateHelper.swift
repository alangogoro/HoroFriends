//
//  DateHelper.swift
//  HoroFriends
//
//  Created by usr on 2021/1/6.
//
import Foundation

extension Date {
    func toDateString() -> String {
        let datFormatter = DateFormatter()
        datFormatter.dateFormat = "MM月dd日"
        return datFormatter.string(from: self)
    }
    
    func toWeekDayString() -> String {
        let datFormatter = DateFormatter()
        datFormatter.locale = Locale(identifier: "zh_Hant_TW")
        datFormatter.dateFormat = "EEEE"
        return datFormatter.string(from: self)
    }
}
