//
//  AddView.swift
//  TODOList
//
//  Created by  HBK on 27/03/25.
//

import SwiftUI

struct AddView: View {
    
    @State var textFieldText: String = ""
    @State var showAlert: Bool = false
    @Environment(ItemViewModel.self) var viewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text("Add Items Here!")
                TextField("Add item..", text: $textFieldText)
                    .padding()
                    .frame(height: 55)
                    .background(Color("TextFieldColor"))
                    .clipShape(.buttonBorder)
                    
                    
                Button {
                    saveItem()
                } label: {
                    Text("Save")
                        .font(.headline)
                        .fontWeight(.semibold)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .foregroundStyle(Color.white)
                        .background(Color.accentColor)
                        .clipShape(.buttonBorder)
                    
                }.alert("Please enter 3 characters atleast", isPresented: $showAlert) {
                    
                }

            }.padding(30)
             .font(.headline)
        }
    }
    
    func saveItem() {
        if textFieldText.count > 3 {
            viewModel.add(item:
                            ItemsList(title: textFieldText,
                                      isCompleted: false))
            dismiss()

        } else {
            showAlert.toggle()
        }
        
    }
}

#Preview {
    NavigationStack {
        AddView()
    }.environment(ItemViewModel())
}
