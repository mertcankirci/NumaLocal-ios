//
//  String+Ext.swift
//  mobvenNavigation
//
//  Created by Mertcan Kırcı on 16.07.2025.
//

import Foundation

extension String {
    var isFlag: Bool {
        if self == "TR" || self == "FR" || self == "IT" || self == "GB" || self == "DE" || self == "ES" {
            return true
        } else {
            return false
        }
    }
}
