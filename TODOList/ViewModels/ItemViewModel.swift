//
//  ItemViewModel.swift
//  TODOList
//
//  Created by  HBK on 27/03/25.
//

import Foundation
import SwiftUI

@Observable class ItemViewModel {
    
    let itemKeys = "item-keys"
    
    var items:[ItemsList] = [] {
        didSet {
            saveItems()
        }
    }
    
    init() {
        getItems()
    }
    
    func move(fromOffsets indexSet: IndexSet, toOffset: Int) {
        items.move(fromOffsets: indexSet, toOffset: toOffset)
    }
    
    func delete(atOffsets indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func add(item: ItemsList) {
        items.append(item)
    }
    
    func updateItem(item: ItemsList) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateItemCompletion()
        }
    }
    
    func getItems() {
        if let data = UserDefaults.standard.value(forKey: itemKeys) as? Data, let itemList = try? JSONDecoder().decode([ItemsList].self, from: data) {
            self.items = itemList
        }
    }
    
    func saveItems() {
        if let itemData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(itemData, forKey: itemKeys)
        }
    }
    
}
