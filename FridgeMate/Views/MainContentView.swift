//
//  MainContentView.swift
//  FridgeMate
//
//  Created by Leo Espinal on 4/28/22.
//

import SwiftUI

struct MainContentView: View {
	@State var selectedIndex = 0

    var body: some View {
		VStack(spacing: 0) {
			ZStack {
				switch selectedIndex {
				case 0:
					MyFridgeView()
						.hiddenNavigationBarStyle()
				case 1:
					// TODO: Replace with custom view and remove navigation view
					NavigationView {
						Text("Second")
							.hiddenNavigationBarStyle()
					}
				case 2:
					// TODO: Replace with custom view and remove navigation view
					NavigationView {
						Text("Third")
							.hiddenNavigationBarStyle()
					}
				default:
					Text("Remaining tabs")
				}
			}

			TabBar(selectedIndex: $selectedIndex)
		}
		.ignoresSafeArea()
    }
}

struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
		ForEach(PreviewDevices.devices, id: \.self) { deviceName in
			MainContentView()
				.previewDevice(PreviewDevice(rawValue: deviceName))
				.previewDisplayName(deviceName)
		}
    }
}
