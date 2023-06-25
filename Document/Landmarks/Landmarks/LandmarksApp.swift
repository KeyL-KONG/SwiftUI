//
//  LandmarksApp.swift
//  Landmarks
//
//  Created by keyl on 2023/6/8.
//

import SwiftUI

@main
struct LandmarksApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
