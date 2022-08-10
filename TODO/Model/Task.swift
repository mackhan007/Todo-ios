//
//  Task.swift
//  TODO
//
//  Created by Mohammed Aman Khan on 11/08/22.
//

import Foundation
import RealmSwift

class Task: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var taskTitle = ""
    @Persisted var completed = false
}
