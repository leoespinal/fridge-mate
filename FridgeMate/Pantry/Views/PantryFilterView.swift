//
//  PantryFilterView.swift
//  FridgeMate
//
//  Created by Leo Espinal on 8/25/24.
//

import SwiftUI
import SwiftData

enum PantryFilterType: String, CaseIterable {
    case all = "All"
    case fridge = "Fridge"
    case freezer = "Freezer"
    case dryPantry = "Dry Pantry"
}

struct PantryFilterView: View {
    @Query var pantryItems: [PantryItem]
    
    var totalNumberOfPantryItems: Int {
        pantryItems.count
    }
    
    var numberOfFridgeItems: Int {
        pantryItems.filter{ $0.location == FoodLocation.fridge.rawValue }.count
    }
    
    var numberOfFreezerItems: Int {
        pantryItems.filter{ $0.location == FoodLocation.freezer.rawValue }.count
    }
    
    var numberOfDryPantryItems: Int {
        pantryItems.filter{ $0.location == FoodLocation.dryPantry.rawValue }.count
    }
    
    @Binding var filterType: PantryFilterType
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 30) {
                ForEach(PantryFilterType.allCases, id: \.rawValue) { type in
                    VStack(spacing: 5) {
                        HStack {
                            Text(type.rawValue)
                                .font(.subheadline)
                                .fontWeight(.bold)
                            ZStack {
                                Circle()
                                    .fill(Color.black.opacity(0.2))
                                    .frame(width: 25, height: 25)
                                switch type {
                                case .all:
                                    Text("\(totalNumberOfPantryItems)")
                                        .font(.caption)
                                        .fontWeight(.regular)
                                case .fridge:
                                    Text("\(numberOfFridgeItems)")
                                        .font(.caption)
                                        .fontWeight(.regular)
                                case .freezer:
                                    Text("\(numberOfFreezerItems)")
                                        .font(.caption)
                                        .fontWeight(.regular)
                                case .dryPantry:
                                    Text("\(numberOfDryPantryItems)")
                                        .font(.caption)
                                        .fontWeight(.regular)
                                }
                            }
                        }
                        .onTapGesture {
                            filterType = type
                        }
                        
                        if type == filterType {
                            Divider()
                                .frame(height: 3)
                                .background(Color.black)
                                .clipShape(
                                    .rect(
                                        topLeadingRadius: 1.5,
                                        bottomLeadingRadius: 0,
                                        bottomTrailingRadius: 0,
                                        topTrailingRadius: 1.5
                                    )
                                )
                        } else {
                            Spacer()
                                .frame(height: 3)
                        }
                    }
                }
            }
            .padding(.horizontal, 16)
        }
    }
}

#Preview {
    PantryView()
        .modelContainer(for: PantryItem.self)
}
