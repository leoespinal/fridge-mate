//
//  CustomTabBar.swift
//  FridgeMate
//
//  Created by Leo Espinal on 4/28/22.
//

import SwiftUI

struct CustomTabBar: View {
	@State var selectedIndex = 0

    var body: some View {
		VStack {
			ZStack {
				switch selectedIndex {
				case 0:
					NavigationView {
						// TODO: Replace with custom view
						Text("First")
//							.navigationTitle("My Fridge")
					}
				case 1:
					NavigationView {
						// TODO: Replace with custom view
						Text("Second")
//							.navigationTitle("Shopping List")
					}
				case 2:
					NavigationView {
						// TODO: Replace with custom view
						Text("Third")
//							.navigationTitle("Settings")
					}
				default:
					Text("Remaining tabs")
				}
			}

			Spacer()

			// Tabs
			HStack(spacing: 80) {
				ForEach(0..<3) { index in
					switch index {
					case 0:
						TabBarItem(
							iconName: "cart",
							width: 35,
							height: 30,
							tapAction: { selectedIndex = index },
							shouldShowBackground: .constant(selectedIndex == index))
					case 1:
						TabBarItem(
							iconName: "list.bullet",
							width: 30,
							height: 24,
							tapAction: { selectedIndex = index },
							shouldShowBackground: .constant(selectedIndex == index))
					case 2:
						TabBarItem(
							iconName: "gear",
							width: 30,
							height: 30,
							tapAction: { selectedIndex = index },
							shouldShowBackground: .constant(selectedIndex == index))
					default:
						EmptyView()
					}
				}
			}
			.frame(maxWidth: .infinity, maxHeight: 80)
			.background(Color.blueColor)
			.clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
			.shadow(color: .blueColor, radius: 4, x: 0, y: 2)

		}
		.ignoresSafeArea()
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
		ForEach(PreviewDevices.devices, id: \.self) { deviceName in
			CustomTabBar()
				.previewDevice(PreviewDevice(rawValue: deviceName))
				.previewDisplayName(deviceName)
		}
    }
}
