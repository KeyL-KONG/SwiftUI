//
//  MyAlternativeScene.swift
//  SceneSample
//
//  Created by keyl on 2023/6/25.
//

import SwiftUI

struct MyAlternativeScene: Scene {
    var body: some Scene {
        WindowGroup {
            AlternativeContentView()
        }
        #if os(macOS)
        Settings {
            SettingsView()
        }
        #endif
    }
}
