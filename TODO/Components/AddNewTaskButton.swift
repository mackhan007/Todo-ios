//
//  AddNewTaskButton.swift
//  TODO
//
//  Created by Mohammed Aman Khan on 11/08/22.
//

import SwiftUI

struct AddNewTaskButton: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(maxWidth: 50)
                .foregroundColor(Color.cyan)
            
            Text("+")
                .font(.title)
                .fontWeight(.heavy)
                .foregroundColor(Color.white)
        }
        .frame(width: 50, height: 50)
        
    }
}

struct AddNewTaskButton_Previews: PreviewProvider {
    static var previews: some View {
        AddNewTaskButton()
    }
}
