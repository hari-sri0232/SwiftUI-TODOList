//
//  ListRowView.swift
//  TODOList
//
//  Created by  HBK on 27/03/25.
//

import SwiftUI

struct ListRowView: View {
    
    var item: ItemsList
    
    init(item: ItemsList) {
        self.item = item
    }
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundStyle(item.isCompleted ? .green : .red)
            Text(item.title)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ListRowView(item: ItemsList(title: "Hi", isCompleted: false))
}
