//
//  ShoppingListView.swift
//  MVVM-Tutorial
//
//  Created by EJ Prokopik on 7/7/22.
//

import SwiftUI

struct ShoppingListView: View {
    @State private var shoppingItems = [ShoppingItem]()
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
                            
                            Text(item.name.trimmingCharacters(in: .whitespacesAndNewlines))
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
            
            TextField("Item Name", text: $name)
                .submitLabel(.done)
                .onSubmit {
                    
                    withAnimation {
                        
                        shoppingItems.append(ShoppingItem(name: name))
                        name = ""
                        
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
