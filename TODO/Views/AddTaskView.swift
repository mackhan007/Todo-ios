//
//  AddTaskView.swift
//  TODO
//
//  Created by Mohammed Aman Khan on 11/08/22.
//

import SwiftUI

struct AddTaskView: View {
    @EnvironmentObject var realManager: RealmManager
    @State private var taskTitle: String = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Create New Task")
                .font(.title3)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TextField("Enter Your Task", text: $taskTitle)
                .textFieldStyle(.roundedBorder)
            
            Button {
                if taskTitle != "" {
                    realManager.addNewTask(title: taskTitle)
                }
                dismiss()
            } label: {
                Text("Add Task")
                    .foregroundColor(Color.white)
                    .padding()
                    .padding(.horizontal)
                    .background(Color.cyan)
                    .cornerRadius(30)
            }
            Spacer()
        }
        .padding(.top, 40)
        .frame(maxHeight: .infinity)
        .padding(.horizontal)
        .background(Color.yellow.opacity(0.3))
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
            .environmentObject(RealmManager())
    }
}
