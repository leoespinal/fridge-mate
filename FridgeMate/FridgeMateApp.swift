//
//  FridgeMateApp.swift
//  FridgeMate
//
//  Created by Leo Espinal on 8/20/24.
//

import SwiftUI
import SwiftData

@main
struct FridgeMateApp: App {
    let container: ModelContainer = {
        let schema = Schema([PantryItem.self])
        let container = try! ModelContainer(for: schema, configurations: [])
        return container
    }()

    var body: some Scene {
        WindowGroup {
            MainView()
        }
        .modelContainer(container)
    }
}
