//
//  PantryItemCard.swift
//  FridgeMate
//
//  Created by Leo Espinal on 8/20/24.
//

import SwiftUI

struct PantryItemCard: View {
    let imageName: String
    let title: String
    let subtitle: String
    let quanity: String
    let location: String
    let isExpiringSoon: Bool
    
    init(imageName: String,
         title: String,
         subtitle: String,
         quanity: String,
         location: String,
         isExpiringSoon: Bool) {
        self.imageName = imageName
        self.title = title
        self.subtitle = subtitle
        self.quanity = quanity
        self.location = location
        self.isExpiringSoon = isExpiringSoon
    }
    
    var body: some View {
        HStack(alignment: .top) {
            Image(systemName: imageName)
            VStack(alignment: .leading, spacing: 8) {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.bold)
                Text(subtitle)
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundStyle(isExpiringSoon ? Color.accentOrange : Color.textLightGray)
            }
            
            Spacer()
            
            VStack(alignment: .leading, spacing: 8) {
                Text(quanity)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text(location)
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
        }
        .frame(height: 60)
        .padding(.horizontal, 16)
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .shadow(color: .gray.opacity(0.3), radius: 4, x: 0, y: 2)
    }
}

#Preview {
    VStack {
        PantryItemCard(imageName: "fork.knife",
                       title: "Beef rib-eye steak",
                       subtitle: "Expiring in 2 days!",
                       quanity: "300 g",
                       location: "Fridge",
                       isExpiringSoon: true)
        
        PantryItemCard(imageName: "fork.knife",
                       title: "Salmon",
                       subtitle: "11 days in",
                       quanity: "150 g",
                       location: "Fridge",
                       isExpiringSoon: false)
    }
    .padding(.horizontal, 16)
}
