//
//  GetAllTasksUseCase.swift
//  WebMetric
//
//  Created by Mohammad Reza Sohrabi on 2024-04-04.
//

import Foundation
import Factory
import Combine

struct GetAllTasksUseCase {

    @Injected(\ModuleDI.tasksRepository) private var repo

    func execute() -> AnyPublisher<[TaskModel], Never> {
        repo.getAllTasks()
    }
}
