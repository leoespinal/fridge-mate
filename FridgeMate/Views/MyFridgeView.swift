//
//  MyFridgeView.swift
//  FridgeMate
//
//  Created by Leo Espinal on 4/28/22.
//

import SwiftUI

struct MyFridgeView: View {
    var body: some View {
		NavigationView {
			ScrollView(showsIndicators: false) {
				VStack(spacing: 134) {
					HStack {
						Text("My Fridge")
							.foregroundColor(.blueColor)
							.font(.system(size: 36, weight: .bold))

						Spacer()

						Button {
							print("Show camera screen")
						} label: {
							Image(systemName: "plus.circle.fill")
								.resizable()
								.frame(width: 30, height: 30)
								.foregroundColor(.accentOrange)
						}
					}

					VStack(spacing: 7) {
						Image("man-shopping")
							.resizable()
							.aspectRatio(contentMode: .fit)
							.frame(width: 205, height: 205)
						Text("Your Fridge is Empty")
							.font(.system(size: 16, weight: .bold))
							.foregroundColor(.textDarkGray)
						Text("Grab some groceries and start tracking what's in your fridge")
							.font(.system(size: 16, weight: .regular))
							.multilineTextAlignment(.center)
							.foregroundColor(.textLightGray)
							.frame(maxWidth: 236)
					}

					Spacer()
				}
				.hiddenNavigationBarStyle()
				.padding(EdgeInsets(top: 20, leading: 16, bottom: 0, trailing: 16))
			}
		}
    }
}

struct MyFridgeView_Previews: PreviewProvider {
    static var previews: some View {
        MyFridgeView()
    }
}
