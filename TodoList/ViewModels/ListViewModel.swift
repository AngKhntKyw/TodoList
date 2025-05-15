//
//  ListViewModel.swift
//  TodoList
//
//  Created by Digital Base on 15/5/25.
//

import Foundation

/*
 
 CRUD Functions
 
 create
 read
 update
 delete
 
 */

class ListViewModel: ObservableObject {
    
    // use @Published in class , we only can use @State in View
    // use UserDefaults in class , we can use @AppStorage in View
    
    @Published var items: [ItemModel] = [] {
        // anytime we change or update or do somthing to this array , didSet function works
        didSet {
            saveItems()
        }
    }
    let itemsKey: String =  "items_list"
    
    
    init() {
        getItems()
    }
    
    
    func getItems () {
        //        let newItems = [
        //            ItemModel(title: "This is the first title", isCompleted: false),
        //            ItemModel(title: "This is the second title", isCompleted: true),
        //            ItemModel(title: "Third", isCompleted: false)
        //        ]
        
        //        items.append(contentsOf: newItems)
        
        
        //        guard let data = UserDefaults.standard.data(forKey: itemsKey) else { return }
        //        guard let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)  else { return }
        
        // combine 2 guard conditions
        
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else {
            return
        }
        self.items = savedItems        
    }
    
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: {$0.id == item.id}) {
            items[index] = item.updateCopletion()
        }
        
        
        //      if  let index = items.firstIndex { (existingItem) -> Bool in
        //            return  existingItem.id == item.id
        //      } {
        //          // run the logic code
        //
        //      }
        
    }
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
    
}
