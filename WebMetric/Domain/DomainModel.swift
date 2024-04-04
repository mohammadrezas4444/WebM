//
//  DomainModel.swift
//  WebMetric
//
//  Created by Mohammad Reza Sohrabi on 2024-04-04.
//

import Foundation

struct TaskModel: Hashable, Identifiable {
    let id: UUID = UUID()
    var title: String
    var description: String
    var isCompleted: Bool = false

    static func == (lhs: TaskModel, rhs: TaskModel) -> Bool {
        lhs.id == rhs.id &&
        lhs.isCompleted == rhs.isCompleted
    }
}
