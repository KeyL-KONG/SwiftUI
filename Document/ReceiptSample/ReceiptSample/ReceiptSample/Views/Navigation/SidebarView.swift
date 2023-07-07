//
//  SidebarView.swift
//  ReceiptSample
//
//  Created by keyl on 2023/6/25.
//

import SwiftUI

enum SidebarItem: Hashable {
    case all, favorites, recents
    case collection(String)
    
    var title: String {
        switch self {
        case .all:
            return "All Recipes"
        case .favorites:
            return "Favorites"
        case .recents:
            return "Recents"
        case .collection(let name):
            return name
        }
    }
}

struct SidebarView: View {
    
    @Binding var selection: SidebarItem?
    @ObservedObject var recipeBox: RecipeBox
    
    var body: some View {
        List(selection: $selection) {
            Section("Library") {
                NavigationLink(value: SidebarItem.all) {
                    Text(SidebarItem.all.title)
                }
                NavigationLink(value: SidebarItem.favorites) {
                    Text(SidebarItem.favorites.title)
                }
                NavigationLink(value: SidebarItem.recents) {
                    Text(SidebarItem.recents.title)
                }
            }
            
            Section("Collections") {
                ForEach(recipeBox.collections, id:\.self) { collectionName in
                    NavigationLink(value: SidebarItem.collection(collectionName)) {
                        Text(collectionName)
                    }
                }
            }
        }
    }
    
    
}
