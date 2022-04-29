//
//  TabBarItemButtonView.swift
//  FridgeMate
//
//  Created by Leo Espinal on 4/28/22.
//

import SwiftUI

struct TabBarItem: View {
	var iconName: String
	var width: CGFloat
	var height: CGFloat
	var tapAction: () -> Void
	@Binding var shouldShowBackground: Bool

    var body: some View {
		if shouldShowBackground {
			ZStack(alignment: .center) {
				TabBarIcon(iconName: iconName, width: width, height: height, tapAction: tapAction)
			}
			.padding(.all, 10)
			.background(Color.blueVariantColor)
			.clipShape(Circle())
		} else {
			TabBarIcon(iconName: iconName, width: width, height: height, tapAction: tapAction)
		}
    }
}

struct TabBarItemButtonView_Previews: PreviewProvider {
    static var previews: some View {
		TabBarItem(iconName: "cart", width: 35, height: 30, tapAction: {
			print("Tab bar button tapped")
		}, shouldShowBackground: .constant(true))
    }
}
