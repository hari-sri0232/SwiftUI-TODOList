//
//  ListDetailView.swift
//  TODOList
//
//  Created by  HBK on 29/03/25.
//

import SwiftUI

struct ListDetailView: View {
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            VStack {
                Text("Detail View")
                Text("Hello world")
                Image(systemName: "house.fill")
            }
        }
    }
}

#Preview {
    ListDetailView()
}
