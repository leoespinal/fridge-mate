//
//  OnboardingView.swift
//  FridgeMate
//
//  Created by Leo Espinal on 4/27/22.
//

import SwiftUI

struct OnboardingView: View {
	private let models = OnboardingScreen.data

    var body: some View {
		TabView {
			ForEach(models) { model in
				OnboardingChildView(model: model, showNextButton: .constant(model.isFinalStep))
			}
		}
		.ignoresSafeArea()
		.tabViewStyle(.page(indexDisplayMode: .always))
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
		ForEach(PreviewDevices.devices, id: \.self) { deviceName in
			OnboardingView()
				.previewDevice(PreviewDevice(rawValue: deviceName))
		}
    }
}
