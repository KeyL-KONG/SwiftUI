//
//  SceneSampleApp.swift
//  SceneSample
//
//  Created by keyl on 2023/6/24.
//

import SwiftUI

@main
struct SceneSampleApp: App {
    var body: some Scene {
        #if os(iOS)
        MyScene()
        #elseif os(macOS)
        MyAlternativeScene()
        #endif
    }
}
