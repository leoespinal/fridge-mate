//
//  FoodCategoryButton.swift
//  FridgeMate
//
//  Created by Leo Espinal on 5/7/22.
//

import SwiftUI

struct FoodCategoryButton: View {
	@State var isSelected = false
	var categoryName: String

	var body: some View {
		Button {
			isSelected.toggle()
		} label: {
			Text(categoryName)
				.foregroundColor(.textWhite)
		}
		.frame(height: 40)
		.frame(maxWidth: .infinity)
		.background(isSelected ? Color.blueColor : Color.blueVariantColor.opacity(0.8))
		.clipShape(
			Capsule(style: .continuous)
		)
		.overlay(
			RoundedRectangle(cornerRadius: 25)
				.stroke(isSelected ? Color.blueColor : Color.white, lineWidth: 2)
		)
	}
}

struct FoodCategoryButton_Previews: PreviewProvider {
    static var previews: some View {
		FoodCategoryButton(categoryName: "Dairy")
    }
}
