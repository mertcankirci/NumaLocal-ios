//
//  SelectableOption.swift
//  mobvenNavigation
//
//  Created by Mertcan Kırcı on 16.07.2025.
//

import SwiftUI

protocol SelectableOption: Identifiable, Equatable, Codable {
    var id: String { get }
    var title: String { get }
    var icon: String? { get }
    var font: Font { get }
}
