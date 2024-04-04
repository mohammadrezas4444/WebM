//
//  ContentView.swift
//  WebMetric
//
//  Created by Mohammad Reza Sohrabi on 2024-04-04.
//

import SwiftUI

struct ContentView: View {

    @ObservedObject var viewModel: TaskListViewModel
    @State private var showAddTaskView = false

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.filteredTasks) { task in
                    TaskRow(task: task, viewModel: viewModel)
                }
                .onDelete(perform: delete)
            }
            .navigationTitle("Tasks")
            .navigationBarItems(trailing: Button(action: {
                showAddTaskView = true
            }) {
                Image(systemName: "plus")
            })
            .sheet(isPresented: $showAddTaskView) {
                AddTaskView(viewModel: ModuleDI.shared.addTaskViewModel.resolve())
            }
            .navigationBarItems(leading: Button(action: {
                viewModel.attemptToGetFilteredTask(completed: true)
            }) {
                Image(uiImage: .strokedCheckmark)
            })
            .navigationBarItems(leading: Button(action: {
                viewModel.attemptToGetFilteredTask(completed: false)
            }) {
                Image(uiImage: .remove)
            })
        }
    }

    func delete(at offsets: IndexSet) {
        for index in offsets {
            viewModel.attemptToRemoveTask(index: index)
        }
    }
}

struct TaskRow: View {
    var task: TaskModel
    @ObservedObject var viewModel: TaskListViewModel

    var body: some View {
        HStack {
            Text(task.title)
            Spacer()
            Button(action: {
                viewModel.attemptToMarkUnmark(index: viewModel.filteredTasks.firstIndex(of: task) ?? 0)
            }) {
                Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
            }
        }
    }
}

struct AddTaskView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: AddTaskViewModel

    @State private var title = ""
    @State private var description = ""

    var body: some View {
        NavigationView {
            Form {
                TextField("Title", text: $title)
                TextField("Description", text: $description)
                Button("Add Task") {
                    viewModel.attemptToAddTask(title: title, description: description)
                    presentationMode.wrappedValue.dismiss()
                }
            }
            .navigationTitle("New Task")
        }
    }
}

#Preview {
    ContentView(viewModel: ModuleDI.shared.tasksViewModel.resolve())
}
