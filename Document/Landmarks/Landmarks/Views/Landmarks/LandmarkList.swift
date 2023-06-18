//
//  LandmarkList.swift
//  Landmarks
//
//  Created by keyl on 2023/6/8.
//

import SwiftUI

struct LandmarkList: View {
    
    @EnvironmentObject var modelData: ModelData
    @State private var showFavoriteOnly = false
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { landmark in
            (!showFavoriteOnly || landmark.isFavorite)
        }
    }
    
    var body: some View {
        NavigationView {
            List {
                Toggle(isOn: $showFavoriteOnly) {
                    Text("Favorites only")
                }
                
                ForEach(filteredLandmarks) { landmark in
                    NavigationLink {
                        LandmarkDetail(landmark: landmark)
                    } label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }.navigationTitle("Landmarks")
        }
    }
    
}

struct LandmarkList_Previews: PreviewProvider {
    
    static var previews: some View {
        LandmarkList()
            .environmentObject(ModelData())
    }
    
}
