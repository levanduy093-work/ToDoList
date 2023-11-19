//
//  Date+Extensions.swift
//  ToDoList
//
//  Created by Lê Văn Duy on 18/11/2023.
//

import SwiftUI

// Date Extensions Needed for Building UI
extension Date {
    // Custom Date Format
    func  format(_ format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        
        return formatter.string(from: self)
    }
    
    // Checking Whether the Date is Today
    var isToday: Bool {
        return Calendar.current.isDateInToday(self)
    }
    
    // Checking if the Date is the same Hour
    var isSameHour: Bool {
        return Calendar.current.compare(self, to: .init(), toGranularity: .hour) == .orderedSame
    }
    
    // Checking if the Date is the same Hour
    var isPast: Bool {
        return Calendar.current.compare(self, to: .init(), toGranularity: .hour) == .orderedAscending
    }
    
    // Fetching Week Based on given Date
    func fetchWeek(_ date: Date = .init()) -> [WeekDay] {
        let calender = Calendar.current
        let startOfDate = calender.startOfDay(for: date)
        
        var week: [WeekDay] = []
        let weekForDate = calender.dateInterval(of: .weekOfMonth, for: startOfDate)
        guard let startOfWeek = weekForDate?.start else {
            return []
        }
        
        // Interating to get the Full week
        (0..<7).forEach { index in
            if let weekDay = calender.date(byAdding: .day, value: index, to: startOfWeek) {
                week.append(.init(date: weekDay))
            }
        }
        
        return week
    }
    
    // Creating next Week, based on the Last Current Week's Date
    func createNextWeek() -> [WeekDay] {
        let calender = Calendar.current
        let startOfLastDate = calender.startOfDay(for: self)
        guard let nextDate = calender.date(byAdding: .day, value: 1, to: startOfLastDate) else {
            return []
        }
        
        return fetchWeek(nextDate)
    }
    
    // Creating Previous Week, based on the First Current Week's Date
    func createPreviousWeek() -> [WeekDay] {
        let calender = Calendar.current
        let startOfFirstDate = calender.startOfDay(for: self)
        guard let previousDate = calender.date(byAdding: .day, value: -1, to: startOfFirstDate) else {
            return []
        }
        
        return fetchWeek(previousDate)
    }
    
    struct WeekDay: Identifiable {
        var id: UUID = .init()
        var date: Date
    }
}
