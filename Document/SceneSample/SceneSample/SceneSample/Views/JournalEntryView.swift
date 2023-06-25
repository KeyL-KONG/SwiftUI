//
//  JournalEntryView.swift
//  SceneSample
//
//  Created by keyl on 2023/6/24.
//

import SwiftUI

struct JournalEntryView: View {
    
    let journalEntry: JournalEntry
    
    private var title: String {
        journalEntry.createdDate.formatted(Date.FormatStyle()
            .weekday(.abbreviated)
            .month(.abbreviated)
            .day()
            .year())
    }
    
    var body: some View {
        ScrollView {
            Text(journalEntry.text)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        #if os(iOS)
        .navigationTitle(title)
        #elseif os(macOS)
        .navigationSubtitle(title)
        #endif
    }
}
 
struct JournalEntryView_Previews: PreviewProvider {
    static var previews: some View {
        JournalEntryView(journalEntry: JournalEntry(createdDate: Date(), text: "text"))
    }
}
