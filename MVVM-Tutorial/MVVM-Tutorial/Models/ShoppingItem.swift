//
//  ShoppingItem.swift
//  MVVM-Tutorial
//
//  Created by EJ Prokopik on 7/7/22.
//

import Foundation

struct ShoppingItem: Identifiable {
    let name: String
    let price: Int
    let id: UUID = UUID()
}
