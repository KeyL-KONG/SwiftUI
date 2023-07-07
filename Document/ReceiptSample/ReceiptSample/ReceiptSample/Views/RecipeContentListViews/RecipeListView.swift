//
//  RecipeListView.swift
//  ReceiptSample
//
//  Created by keyl on 2023/6/25.
//

import SwiftUI

struct RecipeListView: View {
    
    @Binding var selection: Recipe.ID?
    let selectedSidebarItem: SidebarItem
    @EnvironmentObject private var recipeBox: RecipeBox
    
    var body: some View {
        List(recipes, selection: $selection) { recipe in
            NavigationLink(value: recipe.id) {
                RecipeListItemView(recipe: recipe)
            }
            .swipeActions(allowsFullSwipe: false, content: {
                Button(role: .destructive) {
                    withAnimation {
                        recipeBox.delete(recipe)
                    }
                } label: {
                    Image(systemName: "trash")
                }
                
                Button {
                    recipeBox.toggleIsFavorite(recipe)
                } label: {
                    Image(systemName: "heart")
                }
            })
        }
    }
    
    private var recipes: [Recipe] {
        switch selectedSidebarItem {
        case .all:
            return recipeBox.allRecipes
        case .favorites:
            return recipeBox.favoriteRecipes()
        case .recents:
            return recipeBox.recentRecipes()
        case .collection(let collectionName):
            return recipeBox.recipesInCollection(collectionName)
        }
    }
    
}
