//
//  EditTaskUseCase.swift
//  WebMetric
//
//  Created by Mohammad Reza Sohrabi on 2024-04-04.
//

import Foundation
import Factory

struct EditTaskUseCase {

    @Injected(\ModuleDI.tasksRepository) private var repo

    func execute(task: TaskModel, index: Int) {
        repo.editTask(task: task, index: index)
    }
}
