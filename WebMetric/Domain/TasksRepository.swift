//
//  TaskRepository.swift
//  WebMetric
//
//  Created by Mohammad Reza Sohrabi on 2024-04-04.
//

import Foundation
import Combine

protocol TasksRepository {
    func addTask(_ task: TaskModel)
    func removeTask(_ task: TaskModel)
    func editTask(task: TaskModel, index: Int)
    func getAllTasks() -> AnyPublisher<[TaskModel], Never>
}
