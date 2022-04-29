//
//  TabBarItemButtonView.swift
//  FridgeMate
//
//  Created by Leo Espinal on 4/28/22.
//

import SwiftUI

struct TabBarItem: View {
	var iconName: String
	var tapAction: () -> Void
	@Binding var shouldHighlight: Bool

    var body: some View {
		Spacer()
		Button(action: tapAction) {
			Image(systemName: iconName)
				.foregroundColor(shouldHighlight ? .textWhite : .textWhite.opacity(0.5))
				.font(.system(size: 24, weight: .bold))
		}
		Spacer()
    }
}

struct TabBarItemButtonView_Previews: PreviewProvider {
    static var previews: some View {
		TabBarItem(iconName: "cart", tapAction: {}, shouldHighlight: .constant(true))
    }
}
