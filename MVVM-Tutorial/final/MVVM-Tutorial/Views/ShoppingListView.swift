//
//  ShoppingListView.swift
//  MVVM-Tutorial
//
//  Created by EJ Prokopik on 7/7/22.
//

import SwiftUI

struct ShoppingListView: View {
    @StateObject private var viewModel = ShoppingListViewModel()
    
    var body: some View {
        VStack {
            
            if viewModel.shoppingItems.isEmpty {
                
                Text("Add some items to shop for")
                    .foregroundColor(.gray)
                
            } else {
                
                ScrollView {
                    
                    ForEach(viewModel.shoppingItems) { item in
                        
                        HStack {
                            
                            Text(item.formattedName)
                            Spacer()
                            
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color("Card"))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .padding(.horizontal, 8)
                    }
                    
                }
                
            }
            
            Spacer()
            
            TextField("Item Name", text: $viewModel.name)
                .submitLabel(.done)
                .onSubmit {
                    withAnimation {
                        viewModel.addItem()
                    }
                }
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke()
                )
                .padding(.horizontal, 8)
            
        }
        .navigationTitle("Shopping List")
    }
}

struct ShoppingListView_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingListView()
    }
}
