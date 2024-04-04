//
//  TasksRepositoryImplementaion.swift
//  WebMetric
//
//  Created by Mohammad Reza Sohrabi on 2024-04-04.
//

import Foundation
import Combine

struct TasksRepositoryImplementaion: TasksRepository {
    
    private var tasks = CurrentValueSubject<[TaskModel], Never>.init([])
    
    func addTask(_ task: TaskModel) {
        tasks.value.append(task)
    }
    
    func removeTask(_ task: TaskModel) {
        guard let index = tasks.value.firstIndex(where: { $0 == task }) else { return }
        tasks.value.remove(at: index)
    }
    
    func editTask(task: TaskModel, index: Int) {
        tasks.value[index] = task
    }
    
    func getAllTasks() -> AnyPublisher<[TaskModel], Never> {
        tasks.eraseToAnyPublisher()
    }
}
