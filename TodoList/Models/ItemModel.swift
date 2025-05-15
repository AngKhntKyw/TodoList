//
//  ItemModel.swift
//  TodoList
//
//  Created by Digital Base on 15/5/25.
//

import Foundation


// Immutable Struct


// we can decode and encode our model by conforming Codable

struct ItemModel: Identifiable, Codable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    // using this way , we can delcare id  using both parameter and auto declaration
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id =  id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCopletion() -> ItemModel {
        ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
