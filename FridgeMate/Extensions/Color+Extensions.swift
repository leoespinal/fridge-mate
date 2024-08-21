//
//  Color+Extensions.swift
//  FridgeMate
//
//  Created by Leo Espinal on 8/21/24.
//

import SwiftUI

extension Color {
    // MARK: - Primary and Secondary Colors

    /// Hex: #316A90
    /// RGBA: R: 49, G: 106, B: 144:, A: 100
    static var blueColor: Color {
        Color(red: 49/255, green: 106/255, blue: 144/255)
    }

    /// Hex: #5F9EC8
    /// RGBA: R: 95, G: 158, B: 200:, A: 100
    static var blueVariantColor: Color {
        Color(red: 95/255, green: 158/255, blue: 200/255)
    }

    /// Hex: #313B90
    /// RGBA: R: 49, G: 59, B: 144:, A: 100
    static var purpleColor: Color {
        Color(red: 49/255, green: 59/255, blue: 144/255)
    }

    /// Hex: #171C44
    /// RGBA: R: 23, G: 28, B: 68:, A: 100
    static var purpleVariantColor: Color {
        Color(red: 23/255, green: 28/255, blue: 68/255)
    }

    // MARK: - Additional Colors

    /// Accent
    /// Hex: #F04E23
    /// RGBA: R: 240, G: 78, B: 35:, A: 100
    static var accentOrange: Color {
        Color(red: 240/255, green: 78/255, blue: 35/255)
    }

    /// Background
    /// Hex: #F5F5F5
    /// RGBA: R: 245, G: 245, B: 245:, A: 100
    static var backgroundOffWhite: Color {
        Color(red: 245/255, green: 245/255, blue: 245/255)
    }

    /// Primary Text
    /// Hex: #FFFFFF
    /// RGBA: R: 255, G: 255, B: 255:, A: 100
    static var textWhite: Color {
        Color(red: 255/255, green: 255/255, blue: 255/255)
    }

    /// Subtitle Text
    /// Hex: #969595
    /// RGBA: R: 150, G: 149, B:149245:, A: 100
    static var textLightGray: Color {
        Color(red: 150/255, green: 149/255, blue: 149/255)
    }

    /// Hex: #626060
    /// RGBA: R: 98, G: 96, B: 96, A: 100
    static var textDarkGray: Color {
        Color(red: 98/255, green: 96/255, blue: 96/255)
    }
}
