//
//  TabBar.swift
//  FridgeMate
//
//  Created by Leo Espinal on 4/29/22.
//

import SwiftUI

struct TabBar: View {
	let tabBarIconImageNames = ["cart", "list.bullet", "gear"]
	@Binding var selectedIndex: Int

	var body: some View {
		HStack {
			ForEach(0..<3) { index in
				TabBarItem(
					iconName: tabBarIconImageNames[index],
					tapAction: { selectedIndex = index },
					shouldHighlight: .constant(selectedIndex == index)
				)
			}
		}
		.frame(maxWidth: .infinity, maxHeight: 70)
		.background(Color.blueColor)
		.clipShape(
			Capsule(style: .continuous)
		)
		.padding()
		.shadow(color: .blueColor, radius: 4, x: 0, y: 2)
	}
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
		TabBar(selectedIndex: .constant(0))
    }
}
