//
//  CapsuleButton.swift
//  FridgeMate
//
//  Created by Leo Espinal on 4/26/22.
//

import SwiftUI

typealias ButtonAction = () -> Void

struct CapsuleButton: View {
	var title: String
	var color: Color
	@Binding var action: () -> Void

	private var shadowColor: Color {
		switch color {
		case .blueColor:
			return .blueColor
		case .blueVariantColor:
			return .blueVariantColor
		default:
			return .black
		}
	}

	var body: some View {
		Button(action: action) {
			Text(title)
				.font(.system(size: 18, weight: .semibold, design: .default))
				.foregroundColor(.textWhite)
		}
		.frame(width: 291, height: 60)
		.background(color)
		.clipShape(Capsule(style: .continuous))
		.shadow(color: shadowColor, radius: 4, x: 0, y: 2)
	}
}

struct CapsuleButton_Previews: PreviewProvider {
    static var previews: some View {
		CapsuleButton(title: "Test button", color: .blueColor, action: .constant {
			print("Test button tapped")
		})
    }
}
