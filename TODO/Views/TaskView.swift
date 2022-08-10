//
//  TaskView.swift
//  TODO
//
//  Created by Mohammed Aman Khan on 11/08/22.
//

import SwiftUI

struct TaskView: View {
    @EnvironmentObject var realManager: RealmManager
    
    var body: some View {
        VStack {
            Text("My Tasks")
                .font(.title)
                .bold()
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            if realManager.tasks.isEmpty {
                Text("No Tasks found! Use the \n add button, to add new tasks")
                    .font(.title3)
                    .padding()
                    .multilineTextAlignment(.center)
            }
            
            List {
                ForEach(realManager.tasks, id: \.id) { task in
                    if !task.isInvalidated {
                        TaskTile(taskTitle: task.taskTitle, completed: task.completed)
                            .onTapGesture {
                                realManager.updateTask(id: task.id, completed: !task.completed)
                            }
                            .swipeActions(edge: .trailing) {
                                Button(role: .destructive) {
                                    realManager.deletetask(id: task.id)
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                    }
                }
                .listRowSeparator(.hidden)
            }
            .onAppear {
                UITableView.appearance().backgroundColor = UIColor.clear
                UITableViewCell.appearance().backgroundColor = UIColor.clear
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.yellow.opacity(0.3))
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
            .environmentObject(RealmManager())
    }
}
