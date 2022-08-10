//
//  RealmManager.swift
//  TODO
//
//  Created by Mohammed Aman Khan on 11/08/22.
//

import Foundation
import RealmSwift

class RealmManager: ObservableObject {
    private(set) var localRealm: Realm?
    @Published private(set) var tasks: [Task] = []
    
    init() {
        openRealm()
        getTasks()
    }
    
    func openRealm() {
        do {
            let config = Realm.Configuration(schemaVersion: 1)
            
            Realm.Configuration.defaultConfiguration = config
            
            localRealm = try Realm()
        } catch {
            print("Error in opeing Realm: \(error)")
        }
    }
    
    func addNewTask(title: String) {
        if let localRealm = localRealm {
            do {
                try localRealm.write {
                    let newTask = Task(value: [
                        "taskTitle": title,
                        "completed": false
                    ])
                    localRealm.add(newTask)
                    getTasks()
                    print("Added New Task to Realm: \(newTask)")
                }
            } catch {
                print("Adding Task to Realm: \(error)")
            }
        }
    }
    
    func getTasks() {
        if let localRealm = localRealm {
            let allTask = localRealm.objects(Task.self).sorted(byKeyPath: "completed")
            tasks = []
            
            allTask.forEach { task in
                tasks.append(task)
            }
            
        }
    }
    
    func updateTask(id: ObjectId, completed: Bool) {
        if let localRealm = localRealm {
            do {
                let updateTask = localRealm.objects(Task.self).filter(NSPredicate(format: "id == %@", id))
                guard !updateTask.isEmpty else {return}
                
                try localRealm.write {
                    updateTask[0].completed = completed
                    getTasks()
                    print("Updated task with id \(id) to Realm: \(completed)")
                }
            } catch {
                print("Error in updating the task \(id), error: \(error)")
            }
        }
    }
    
    func deletetask(id: ObjectId) {
        if let localRealm = localRealm {
            do {
                let deleteTask = localRealm.objects(Task.self).filter(NSPredicate(format: "id == %@", id))
                guard !deleteTask.isEmpty else {return}
                
                try localRealm.write {
                    localRealm.delete(deleteTask)
                    getTasks()
                    
                    print("Deleted task with id \(id)")
                }
            } catch {
                print("Error in deleting the task \(id), error: \(error)")
            }
        }
    }
}
