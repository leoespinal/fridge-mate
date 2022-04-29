//
//  OnboardingPageView.swift
//  FridgeMate
//
//  Created by Leo Espinal on 4/27/22.
//

import SwiftUI

struct OnboardingPageView: View {
	let model: OnboardingScreen
	@Binding var showNextButton: Bool
	@Environment(\.dismiss) private var dismiss

    var body: some View {
		VStack(alignment: .center, spacing: 25) {
			Image(model.imageName)
				.resizable()
				.aspectRatio(contentMode: .fit)
				.frame(maxWidth: .infinity)
				.frame(height: 390)

			VStack(spacing: 12) {
				Text(model.title)
					.font(.system(size: 24, weight: .bold))
				.foregroundColor(.textWhite)
				Text(model.subtitle)
					.font(.system(size: 16, weight: .regular))
					.multilineTextAlignment(.center)
					.foregroundColor(.textWhite)
					.padding(EdgeInsets(top: 0, leading: 50, bottom: 0, trailing: 50))
			}
			Spacer()

			if showNextButton {
				CapsuleButton(title: "Next", color: .blueVariantColor, action: .constant {
					saveOnboardingCompletedState()
					dismiss()
				})
			}

			Spacer()
		}
		.padding(.top, 80)
		.background(Color.blueColor)
		.ignoresSafeArea()
    }

	private func saveOnboardingCompletedState() {
		UserDefaults.storeValue(true, forKey: "CompletedOnboarding")
	}
}

struct OnboardingChildView_Previews: PreviewProvider {
    static var previews: some View {
		OnboardingPageView(
			model: OnboardingScreen(
				imageName: "person-grocery-shopping",
				title: "Buy your groceries",
				subtitle: "Start by picking out what you would like to have in your fridge"),
			showNextButton: .constant(false)
		)
    }
}
