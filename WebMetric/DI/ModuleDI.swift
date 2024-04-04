//
//  ModuleDI.swift
//  WebMetric
//
//  Created by Mohammad Reza Sohrabi on 2024-04-04.
//

import Foundation
import Factory

final class ModuleDI: SharedContainer {

    static var shared = ModuleDI()
    var manager = ContainerManager()

    var tasksRepository: Factory<TasksRepository> {
        self { TasksRepositoryImplementaion() }.singleton
    }

    var addTaskUseCase: Factory<AddTaskUseCase> {
        self { AddTaskUseCase() }
    }

    var removeTaskUseCase: Factory<RemoveTaskUseCase> {
        self { RemoveTaskUseCase() }
    }

    var editTaskUseCase: Factory<EditTaskUseCase> {
        self { EditTaskUseCase() }
    }

    var getAllTasksUseCase: Factory<GetAllTasksUseCase> {
        self { GetAllTasksUseCase() }
    }

    var tasksViewModel: Factory<TaskListViewModel> {
        self { TaskListViewModel() }
    }

    var addTaskViewModel: Factory<AddTaskViewModel> {
        self { AddTaskViewModel() }
    }
}
