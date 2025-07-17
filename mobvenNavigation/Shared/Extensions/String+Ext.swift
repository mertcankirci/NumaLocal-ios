//
//  String+Ext.swift
//  mobvenNavigation
//
//  Created by Mertcan Kırcı on 16.07.2025.
//

import Foundation

extension String {
    var containsEmoji: Bool {
        unicodeScalars.contains { $0.properties.isEmoji }
    }
}
