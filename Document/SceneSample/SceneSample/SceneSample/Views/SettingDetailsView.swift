//
//  SettingDetailsView.swift
//  SceneSample
//
//  Created by keyl on 2023/6/24.
//

import SwiftUI

struct SettingDetailsView: View {
    
    let title: String
    @AppStorage("option1") private var option1 = true
    @AppStorage("option2") private var option2 = true
    
    var body: some View {
        Form {
            Section {
                Toggle("Enable option 1", isOn: $option1)
                    .toggleStyle(.automatic)
                Toggle("Enable option 2", isOn: $option2)
                    .toggleStyle(.automatic)
            }
        }
        .navigationTitle(title)
    }

}

struct SettingDetailsView_Preview: PreviewProvider {
    
    static var previews: some View {
        SettingDetailsView(title: "settings")
    }
    
}
