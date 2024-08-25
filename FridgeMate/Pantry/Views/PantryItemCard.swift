//
//  PantryItemCard.swift
//  FridgeMate
//
//  Created by Leo Espinal on 8/20/24.
//

import SwiftUI

struct PantryItemCard: View {
    let pantryItem: PantryItem
    
    init(pantryItem: PantryItem) {
        self.pantryItem = pantryItem
    }
    
    var body: some View {
        HStack(alignment: .top) {
            Image(pantryItem.foodCategory.icon)
                .resizable()
                .scaledToFit()
                .foregroundStyle(pantryItem.foodCategory.iconTint)
                .frame(width: 25, height: 25)
            VStack(alignment: .leading, spacing: 8) {
                Text(pantryItem.name)
                    .font(.subheadline)
                    .fontWeight(.bold)
                Text(pantryItem.subtitle)
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundStyle(pantryItem.isExpiring ? Color.accentOrange : Color.textLightGray)
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 8) {
                Text("Qty \(pantryItem.quantity)")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text(pantryItem.location.rawValue)
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
        PantryItemCard(
            pantryItem: PantryItem(
                name: "Beef rib-eye steak",
                quantity: 2,
                dateAdded: .now,
                expirationDate: .now,
                enabledReminder: false,
                expirationDateReminderDays: 0,
                location: .fridge,
                category: .beef
            )
        )
        
        PantryItemCard(
            pantryItem: PantryItem(
                name: "Beans",
                quantity: 4,
                dateAdded: .now,
                expirationDate: .now,
                enabledReminder: false,
                expirationDateReminderDays: 0,
                location: .dryPantry,
                category: .veggies
            )
        )
    }
    .padding(.horizontal, 16)
}
