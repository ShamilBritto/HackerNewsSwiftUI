//
//  HackerNewsSwiftUIApp.swift
//  HackerNewsSwiftUI
//
//  Created by GGS-BKS on 11/01/23.
//

import SwiftUI

@main
struct HackerNewsSwiftUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
