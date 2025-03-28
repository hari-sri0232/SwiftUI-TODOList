//
//  ListView.swift
//  TODOList
//
//  Created by  HBK on 27/03/25.
//

import SwiftUI

struct ListView: View {
    
    @Environment(ItemViewModel.self) var viewModel
    
    var body: some View {
        List {
            ForEach(viewModel.items) { item in
                ListRowView(item: item)
                    .onTapGesture {
                        viewModel.updateItem(item: item)
                }
            }.onDelete(perform: viewModel.delete(atOffsets:))
                .onMove(perform: viewModel.move(fromOffsets:toOffset:))
        }.navigationTitle("TODO List")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink("Add") {
                        AddView()
                    }
                }
            }
    }

}

#Preview {
    NavigationStack {
        ListView()
    }.environment(ItemViewModel())
    
}
