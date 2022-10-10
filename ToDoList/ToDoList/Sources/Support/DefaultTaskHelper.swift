//
//  DefaultTaskHelper.swift
//  ToDoList
//
//  Created by Anderson Sales on 09/10/22.
//

import Foundation

class DefaultTaskHelper {
    
    let keyTask: String = "keyTask"
    
    public func saveTaskList(list: [MyTask]){
        do {
            let auxiliaryList = try JSONEncoder().encode(list)
            UserDefaults.standard.set(auxiliaryList, forKey: self.keyTask)
        } catch {
            print(error)
        }
    }
    
    public func getTaskList() -> [MyTask]{
        do {
            guard let list = UserDefaults.standard.object(forKey: self.keyTask) else { return [] }
            let auxiliaryList = try JSONDecoder().decode([MyTask].self, from: list as! Data)
            return auxiliaryList
        }catch {
            print(error)
        }
        return []
    }
    
    public func updateTask(){
        
    }
    
    public func deleteTask(){
        
    }
    
}
