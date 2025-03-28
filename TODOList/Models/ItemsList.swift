//
//  ItemsList.swift
//  TODOList
//
//  Created by  HBK on 27/03/25.
//

import Foundation

struct ItemsList: Identifiable, Codable {
    
    var title: String
    var isCompleted: Bool
    var id: String
    
    init(title: String, isCompleted: Bool, id: String = UUID().uuidString) {
        self.title = title
        self.isCompleted = isCompleted
        self.id = id
    }
    
    func updateItemCompletion() -> ItemsList {
        return ItemsList(title: title, isCompleted: !isCompleted, id: id)
    }
}
