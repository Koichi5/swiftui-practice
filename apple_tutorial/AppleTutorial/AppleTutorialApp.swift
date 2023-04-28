//
//  apple_tutorialApp.swift
//  apple_tutorial
//
//  Created by Koichi Kishimoto on 2023/04/21.
//

import SwiftUI

@main
struct AppleTutorialApp: App {
    @StateObject private var store = ScrumStore()
//    @State private var scrums = DailyScrum.sampleData
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $store.scrums) {
                Task {
                    do {
                        try await store.save(scrums: store.scrums)
                    } catch {
                        fatalError(error.localizedDescription)
                    }
                }
            }
            .task {
                do {
                    try await store.load()
                } catch {
                    fatalError(error.localizedDescription)
                }
            }
        }
    }
}
