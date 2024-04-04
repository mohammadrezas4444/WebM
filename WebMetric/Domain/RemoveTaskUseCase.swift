//
//  RemoveTaskUseCase.swift
//  WebMetric
//
//  Created by Mohammad Reza Sohrabi on 2024-04-04.
//

import Foundation
import Factory

struct RemoveTaskUseCase {

    @Injected(\ModuleDI.tasksRepository) private var repo

    func execute(_ task: TaskModel) {
        repo.removeTask(task)
    }
}
