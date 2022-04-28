//
//  OnboardingScreen.swift
//  FridgeMate
//
//  Created by Leo Espinal on 4/27/22.
//

import UIKit

struct OnboardingScreen: Identifiable, Equatable {
	let id = UUID()
	let imageName: String
	let title: String
	let subtitle: String
	var isFinalStep = false

	static let data = [
		OnboardingScreen(
			imageName: "person-grocery-shopping",
			title: "Buy your groceries",
			subtitle: "Start by picking out what you would like to have in your fridge"
		),
		OnboardingScreen(
			imageName: "angle-phone",
			title: "Add each item in app",
			subtitle: "Add each of the items that you would like to keep track of"
		),
		OnboardingScreen(
			imageName: "notification-bell",
			title: "Enable reminders",
			subtitle: "Enable notification reminders to remember when to consume each item in your fridge"
		),
		OnboardingScreen(
			imageName: "clipboard",
			title: "Make grocery shopping easy",
			subtitle: "Create shopping lists to make keeping track of grocery shopping simple",
			isFinalStep: true
		)
	]
}
