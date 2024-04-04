//
//  AddTaskUseCase.swift
//  WebMetric
//
//  Created by Mohammad Reza Sohrabi on 2024-04-04.
//

import Foundation
import Factory

struct AddTaskUseCase {

    @Injected(\ModuleDI.tasksRepository) private var repo

    func execute(_ task: TaskModel) {
        repo.addTask(task)
    }
}
