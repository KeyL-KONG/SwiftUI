//
//  RecipeDetailToolbar.swift
//  ReceiptSample
//
//  Created by keyl on 2023/6/26.
//

import SwiftUI

struct RecipeDetailToolbar: ToolbarContent {
    
    @Binding var recipe: Recipe
    @Binding var showDeleteConfirmation: Bool
    let deleteRecipe: () -> Void
    
    var body: some ToolbarContent {
        ToolbarItem(placement: toolbarItemPlacement) {
            Toggle(isOn: $recipe.isFavorite) {
                Image(systemName: "heart")
                    .symbolVariant(recipe.isFavorite ? .fill : .none)
            }
            .toggleStyle(.button)
        }
        
        ToolbarItem(placement: toolbarItemPlacement) {
            Button(role: .destructive) {
                showDeleteConfirmation = true
            } label: {
                Image(systemName: "trash")
            }
            .alert("Delete Recipe?", isPresented: $showDeleteConfirmation) {
                Button(role: .destructive) {
                    withAnimation {
                        deleteRecipe()  
                    }
                } label: {
                    Text("Delete \(recipe.title)")
                }

            }
        }
    }
    
    private var toolbarItemPlacement: ToolbarItemPlacement {
        #if os(macOS)
        .automatic
        #else
        .navigationBarTrailing
        #endif
    }
}
