//
//  PantryItemCard.swift
//  FridgeMate
//
//  Created by Leo Espinal on 8/20/24.
//

import SwiftUI

struct PantryItemCard: View {
    let pantryItem: PantryItem
    
    var subtitleColor: Color {
        if pantryItem.hasExpired {
            return .red
        } else if pantryItem.isExpiring {
            return .accentOrange
        } else {
            return .textLightGray
        }
    }
    
    init(pantryItem: PantryItem) {
        self.pantryItem = pantryItem
    }
    
    var body: some View {
        HStack(alignment: .top) {
            if let icon = FoodCategory(rawValue: pantryItem.foodCategory)?.icon {
                Image(icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
            }
            VStack(alignment: .leading, spacing: 8) {
                Text(pantryItem.name)
                    .font(.subheadline)
                    .fontWeight(.bold)
                Text(pantryItem.subtitle)
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundStyle(subtitleColor)
            }
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 8) {
                Text("Qty \(pantryItem.quantity)")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                if let location = FoodLocation(rawValue: pantryItem.location) {
                    Text(location.rawValue)
                        .font(.caption)
                        .foregroundStyle(.gray)
                }
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
                location: FoodLocation.fridge.rawValue,
                category: FoodCategory.beef.rawValue
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
                location: FoodLocation.dryPantry.rawValue,
                category: FoodCategory.veggies.rawValue
            )
        )
    }
    .padding(.horizontal, 16)
}
