//
//  ContentView.swift
//  To-Do List App
//
//  Created by Hamza Farah on 9/3/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var taskVM = TaskViewModel()
    @State private var newTask = ""
    
    var body: some View {
        NavigationView {
            VStack {
                // Input Row
                HStack {
                    TextField("Enter new task", text: $newTask)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button(action: {
                        guard !newTask.isEmpty else { return }
                        taskVM.addTask(title: newTask)
                        newTask = ""
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.title2)
                    }
                }
                .padding()
                
                // Task List
                List {
                    ForEach(taskVM.tasks) { task in
                        HStack {
                            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                                .onTapGesture {
                                    taskVM.toggleCompletion(task: task)
                                }
                            Text(task.title)
                                .strikethrough(task.isCompleted)
                        }
                    }
                    .onDelete(perform: taskVM.deleteTask)
                }
            }
            .navigationTitle("To-Do List 📝")
        }
    }
}

#Preview {
    ContentView()
}
