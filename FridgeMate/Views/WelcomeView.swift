//
//  WelcomeView.swift
//  FridgeMate
//
//  Created by Leo Espinal on 4/26/22.
//

import SwiftUI

struct WelcomeView: View {
	private struct Constants {
		static let welcomeViewEdgeInsets: EdgeInsets = EdgeInsets(top: 60, leading: 50, bottom: 40, trailing: 50)
		static let imageViewDimension: CGFloat = 291
		static let subtitleMaxWidth: CGFloat = 222
		static let titleAndSubtitleStackWidth: CGFloat = 291
	}

	@State private var getStartedButtonAction: ButtonAction = {
		print("Tapped get started button")
	}

    var body: some View {
		VStack {
			Image("cherry-grocery-store")
				.resizable()
				.shadow(color: .blueVariantColor, radius: 4, x: 0, y: 2)
				.frame(width: Constants.imageViewDimension, height: Constants.imageViewDimension)
			
			// Title and subtitle
			HStack {
				VStack(alignment: .leading, spacing: 16) {
					Text("Fridge\nMate")
						.font(.system(size: 48, weight: .bold, design: .default))
						.foregroundColor(.blueColor)
						.multilineTextAlignment(.leading)
					Text("Keep track of your groceries to prevent them from going to waste.")
						.foregroundColor(.textLightGray)
						.frame(maxWidth: Constants.subtitleMaxWidth)
				}
				Spacer()
			}
			.frame(width: Constants.titleAndSubtitleStackWidth)
			
			Spacer()
			
			// Get started button
			CapsuleButton(title: "Get Started", color: .blueColor, action: $getStartedButtonAction)
		}
		.frame(maxWidth: .infinity)
		.padding(Constants.welcomeViewEdgeInsets)
		.background(Color.backgroundOffWhite)
		.ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
