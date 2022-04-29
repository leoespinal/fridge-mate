//
//  TabBarIcon.swift
//  FridgeMate
//
//  Created by Leo Espinal on 4/28/22.
//

import SwiftUI

struct TabBarIcon: View {
	var iconName: String
	var width: CGFloat
	var height: CGFloat
	var tapAction: () -> Void

	var body: some View {
		Image(systemName: iconName)
			.resizable()
			.foregroundColor(.textWhite)
			.frame(width: width, height: height)
			.onTapGesture {
				tapAction()
			}
	}
}

struct TabBarIcon_Previews: PreviewProvider {
    static var previews: some View {
		TabBarIcon(iconName: "cart", width: 35, height: 30, tapAction: {
			print("Tab bar button tapped")})
    }
}
