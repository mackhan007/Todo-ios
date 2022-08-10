//
//  TaskTile.swift
//  TODO
//
//  Created by Mohammed Aman Khan on 11/08/22.
//

import SwiftUI

struct TaskTile: View {
    var taskTitle: String
    var completed: Bool
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: completed ?
                  "checkmark.circle" : "circle" )
            Text(taskTitle)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct TaskTile_Previews: PreviewProvider {
    static var previews: some View {
        TaskTile(
            taskTitle: "Testing", completed: false
        )
    }
}
