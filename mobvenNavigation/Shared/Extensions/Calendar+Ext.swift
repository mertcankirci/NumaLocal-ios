//
//  Calendar+Ext.swift
//  mobvenNavigation
//
//  Created by Mertcan Kırcı on 18.07.2025.
//

import Foundation

extension Calendar {
    func weekDaySymbolsMondayFirst() -> [String] {
        var symbols = DateFormatter().shortWeekdaySymbols ?? []
        if symbols.count == 7 {
            let sunday = symbols.removeFirst()
            symbols.append(sunday)
        }
        return symbols
    }

    func shortWeekdaySymbol(for date: Date) -> String {
        let symbols = weekDaySymbolsMondayFirst()
        let index = (component(.weekday, from: date) + 5) % 7
        return symbols[index]
    }

    func startOfWeek(for date: Date) -> Date {
        let weekday = component(.weekday, from: date)
        let offset = weekday == 1 ? -6 : -(weekday - 2) // Pazartesi = 2, Pazar = 1
        return self.date(byAdding: .day, value: offset, to: startOfDay(for: date))!
    }
}




