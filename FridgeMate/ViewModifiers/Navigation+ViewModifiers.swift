//
//  Navigation+ViewModifiers.swift
//  FridgeMate
//
//  Created by Leo Espinal on 4/29/22.
//

import SwiftUI

struct HiddenNavigationBar: ViewModifier {

	func body(content: Content) -> some View {
		content
			.navigationTitle(Text(""))
			.navigationBarTitleDisplayMode(.inline)
			.navigationBarHidden(true)
			.navigationBarBackButtonHidden(true)
	}
}

extension View {
	func hiddenNavigationBarStyle() -> some View {
		modifier( HiddenNavigationBar() )
	}
}
