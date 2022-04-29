//
//  FridgeMateApp.swift
//  FridgeMate
//
//  Created by Leo Espinal on 4/26/22.
//

import SwiftUI

@main
struct FridgeMateApp: App {
	private var hasCompletedOnboarding = UserDefaults.retrieveValue(using: "CompletedOnboarding") as? Bool ?? false

    var body: some Scene {
        WindowGroup {
			if hasCompletedOnboarding {
				MainContentView()
			} else {
				WelcomeView()
			}
        }
    }
}
