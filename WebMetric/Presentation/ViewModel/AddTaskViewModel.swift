//
//  AddTaskViewModel.swift
//  WebMetric
//
//  Created by Mohammad Reza Sohrabi on 2024-04-04.
//

import Foundation
import Factory

class AddTaskViewModel: ObservableObject {

    @Injected(\ModuleDI.addTaskUseCase) private var addTaskUseCase
    
    // MARK: - Interact by user
    func attemptToAddTask(title: String, description: String) {
        let task = TaskModel(title: title, description: description)
        addTaskUseCase.execute(task)
    }
}
