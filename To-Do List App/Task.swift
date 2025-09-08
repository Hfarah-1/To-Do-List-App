//
//  Task.swift
//  To-Do List App
//
//  Created by Hamza Farah on 9/3/25.
//

import Foundation

struct Task: Identifiable, Codable {
    var id = UUID()
    var title: String
    var isCompleted: Bool = false
}
