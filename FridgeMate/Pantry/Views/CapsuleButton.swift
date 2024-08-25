//
//  CapsuleButton.swift
//  FridgeMate
//
//  Created by Leo Espinal on 8/25/24.
//

import SwiftUI

typealias ButtonAction = () -> Void

struct CapsuleButton: View {
    let title: String
    let color: Color
    let fontSize: CGFloat
    let height: CGFloat
    @Binding var action: () -> Void

    private var shadowColor: Color {
        switch color {
        case .blueColor:
            return .blueColor
        case .blueVariantColor:
            return .blueVariantColor
        case .accentOrange:
            return .accentOrange
        case .green:
            return .green
        default:
            return .black
        }
    }

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: fontSize, weight: .semibold, design: .default))
                .foregroundStyle(Color.textWhite)
        }
        .frame(height: height)
        .frame(maxWidth: .infinity)
        .background(color)
        .clipShape(Capsule(style: .continuous))
    }
}

#Preview {
    VStack {
        CapsuleButton(title: "Test button", color: .blueColor, fontSize: 18, height: 60, action: .constant {
            print("Test button tapped")
        })
    }
}
