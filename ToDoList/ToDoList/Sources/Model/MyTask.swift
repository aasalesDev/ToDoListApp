//
//  Task.swift
//  ToDoList
//
//  Created by Anderson Sales on 09/10/22.
//

import Foundation

class MyTask: Codable {
    var id: Int
    var description: String
    var time: String
    var date: String
    
    init(id: Int, description: String, time: String, date: String) {
        self.id = id
        self.description = description
        self.time = time
        self.date = date
    }
}
