//
//  FullFuncApp.swift
//  FullFunc
//
//  Created by Pengkhieng Kim on 5/3/25.
//

import SwiftUI

@main
struct FullFuncApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
