//
//  JournalAppApp.swift
//  JournalApp
//
//  Created by Gabriel Marquez on 2023-08-01.
//

import SwiftUI

@main
struct JournalAppApp: App {
    @StateObject var journalData = JournalData()
    var body: some Scene {
        WindowGroup {
            EntryList(journalData: journalData)
                .task {
                    journalData.load()
                }
                .onChange(of: journalData.entries) { _ in
                    journalData.save()
                }
        }
    }
}
