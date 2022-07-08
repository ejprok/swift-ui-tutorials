//
//  ShoppingListView.swift
//  MVVM-Tutorial
//
//  Created by EJ Prokopik on 7/7/22.
//

import SwiftUI

struct ShoppingListView: View {
    @State private var shoppingItems = [ShoppingItem]()
    @State private var showingAlert = false
    @State private var name: String = ""
    
    var body: some View {
        VStack {
            if shoppingItems.isEmpty {
                Text("Add some items to shop for")
                    .foregroundColor(.gray)
            } else {
                ScrollView {
                    ForEach(shoppingItems) { item in
                        HStack {
                            
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
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
            TextField("Name", text: $name)
            
            Button("Add Item") {
                shoppingItems.append(ShoppingItem(name: name, price: 12))
            }
            .frame(maxWidth: .infinity)
        }
        .navigationTitle("Shopping List")
    }
}

struct ShoppingListView_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingListView()
    }
}
