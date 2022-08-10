//
//  ContentView.swift
//  TODO
//
//  Created by Mohammed Aman Khan on 11/08/22.
//

import SwiftUI

struct ContentView: View {
    @State private var realManager = RealmManager()
    @State private var showAddNewTask: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            TaskView()
                .environmentObject(realManager)
            
            AddNewTaskButton()
                .padding()
                .onTapGesture {
                    showAddNewTask = true
                }
        }
        .sheet(isPresented: $showAddNewTask) {
            AddTaskView()
                .environmentObject(realManager)
        }
        .frame(maxWidth: .infinity,
               maxHeight: .infinity, alignment: .bottom)
        .background(Color.yellow.opacity(0.3))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
