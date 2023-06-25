//
//  DetailView.swift
//  SceneSample
//
//  Created by keyl on 2023/6/25.
//

import SwiftUI

struct DetailView: View {
    @Binding var selectedEntry: JournalEntry?
    
    var body: some View {
        if let entry = selectedEntry {
            JournalEntryView(journalEntry: entry)
        } else {
            Text("select a jounal entry")
        }
    }
}
