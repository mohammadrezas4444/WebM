//
//  TaskListViewModel.swift
//  WebMetric
//
//  Created by Mohammad Reza Sohrabi on 2024-04-04.
//

import Foundation
import Factory

class TaskListViewModel: ObservableObject {
    
    // MARK: - Injected
    @Injected(\ModuleDI.removeTaskUseCase) private var removeTaskUseCase
    @Injected(\ModuleDI.editTaskUseCase) private var editTaskUseCase
    @Injected(\ModuleDI.getAllTasksUseCase) private var getAllTasksUseCase

    // MARK: - Properties
    private var tasks: [TaskModel] = []
    @Published var filteredTasks: [TaskModel] = []

    private var cancelBag = CancelBag()

    // MARK: - Init
    init() {
        getAllTasks()
    }

    private func getAllTasks() {
        getAllTasksUseCase
            .execute()
            .sink { [weak self] taskList in
                guard let self else { return }
                tasks = taskList
                filteredTasks = taskList
            }.store(in: cancelBag)
    }

    // MARK: - Interact by user
    func attemptToRemoveTask(index: Int) {
        guard index < tasks.count, index >= 0 else { return }
        removeTaskUseCase.execute(tasks[index])
    }

    func attemptToMarkUnmark(index: Int) {
        guard index < tasks.count, index >= 0 else { return }
        var task = tasks[index]
        task.isCompleted = !task.isCompleted
        editTaskUseCase.execute(task: task, index: index)
    }

    func attemptToGetFilteredTask(completed: Bool) {
        filteredTasks = tasks.filter { $0.isCompleted == completed}
    }
}
