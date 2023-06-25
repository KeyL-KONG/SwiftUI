//
//  JournalEntryListItem.swift
//  SceneSample
//
//  Created by keyl on 2023/6/24.
//

import SwiftUI

struct JournalEntryListItem: View {
    let journalEntry: JournalEntry
    
    var body: some View {
        VStack(alignment: .leading) {
            DateView(date: journalEntry.createdDate)
            Text("\(journalEntry.text)").lineLimit(2)
        }
    }
}
