//
//  TODOListApp.swift
//  TODOList
//
//  Created by  HBK on 27/03/25.
//

import SwiftUI

@main
struct TODOListApp: App {
    // TODO
    @State var viewModel: ItemViewModel = ItemViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ListView()
                    .navigationTitle("TODO List")
                    .navigationBarTitleDisplayMode(.inline)
            }.environment(viewModel)
           
        }
    }
}
