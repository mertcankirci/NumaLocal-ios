//
//  Date+Ext.swift
//  mobvenNavigation
//
//  Created by Mertcan Kırcı on 21.07.2025.
//

import Foundation

import Foundation

extension Date {
    var greetingString: String {
        let hour = Calendar.current.component(.hour, from: self)
        return hour < 12 ? "Good morning" : "Good afternoon"
    }
}

