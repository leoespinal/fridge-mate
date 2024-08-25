//
//  PantryItemSheet.swift
//  FridgeMate
//
//  Created by Leo Espinal on 8/21/24.
//

import SwiftUI

struct PantryItemSheet: View {
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    @Bindable var pantryItem: PantryItem
    @Binding var pantryItemSheetPresentationSelection: PresentationDetent
    
    private var expirationText: String {
        if pantryItem.numberOfDaysToExpiration < 1 {
            return "today!"
        } else if pantryItem.numberOfDaysToExpiration == 1 {
            return "in \(pantryItem.numberOfDaysToExpiration) day!"
        } else {
            return "in \(pantryItem.numberOfDaysToExpiration) days!"
        }
    }
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 16) {
                HStack {
                    Text(pantryItem.name)
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                }
                
                HStack {
                    Image(pantryItem.foodCategory.icon)
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(pantryItem.foodCategory.iconTint)
                        .frame(width: 25, height: 25)
                    Text(pantryItem.foodCategory.rawValue)
                        .fontWeight(.bold)
                    Text("in")
                    Text(pantryItem.location.rawValue)
                        .fontWeight(.bold)
                }
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("In the pantry")
                            .font(.footnote)
                        Text(pantryItem.numberOfDaysInPantry != 1 ?
                             "\(pantryItem.numberOfDaysInPantry) days" : "\(pantryItem.numberOfDaysInPantry) day")
                        .font(.title3)
                        .fontWeight(.bold)
                    }
                    Spacer()
                    if pantryItem.isExpiring {
                        Divider()
                        VStack(alignment: .leading) {
                            Text("Expiring")
                                .font(.footnote)
                                .foregroundStyle(Color.accentOrange)
                            Text(expirationText)
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundStyle(Color.accentOrange)
                        }
                        Spacer()
                    }
                    
                    Divider()
                
                    VStack(alignment: .leading) {
                        Text("Quantity")
                            .font(.footnote)
                        Text("\(pantryItem.quantity)")
                            .font(.title3)
                            .fontWeight(.bold)
                    }
                    Spacer()
                }
                .frame(height: 50)
                
                HStack {
                    if pantryItemSheetPresentationSelection != .large {
                        CapsuleButton(title: "Edit", color: .red, fontSize: 16, height: 45, action: .constant {
                            pantryItemSheetPresentationSelection = .large
                        })
                        CapsuleButton(title: "Mark Consumed", color: .green, fontSize: 16, height: 45, action: .constant {
                            dismiss()
                        })
                    } else {
                        CapsuleButton(title: "Mark Consumed", color: .green, fontSize: 16, height: 45, action: .constant {
                            dismiss()
                        })
                        .padding(.bottom, 16)
                    }
                }
            }
            .padding(.horizontal, 16)
            
            if pantryItemSheetPresentationSelection == .large {
                Form {
                    TextField("Name", text: $pantryItem.name)
                    DatePicker("Expiration Date", selection: $pantryItem.expirationDate, displayedComponents: .date)
                    Picker(selection: $pantryItem.quantity) {
                        ForEach((1...99), id: \.self) {
                            Text("\($0)")
                                .tag("")
                        }
                    } label: {
                        Text("Quantity")
                    }
                    .pickerStyle(.automatic)
                    Toggle(isOn: $pantryItem.enabledReminder, label: {
                        Text("Enable Reminders")
                    })
                    if pantryItem.enabledReminder {
                        Picker(selection: $pantryItem.expirationDateReminderDays) {
                            ForEach(1...99, id: \.self) {
                                if $0 == 1 {
                                    Text("\($0) day")
                                        .tag("")
                                } else {
                                    Text("\($0) days")
                                        .tag("")
                                }
                            }
                        } label: {
                            Text("Days before expiration")
                        }
                        .pickerStyle(.automatic)
                    }
                    Picker(selection: $pantryItem.foodCategory) {
                        ForEach(FoodCategory.allCases, id: \.self) { foodCategory in
                            Text(foodCategory.rawValue)
                                .tag("")
                        }
                    } label: {
                        Text("Category")
                    }
                    .pickerStyle(.automatic)
                    
                    Picker(selection: $pantryItem.location) {
                        ForEach(FoodLocation.allCases, id: \.self) { foodLocation in
                            Text(foodLocation.rawValue)
                                .tag("")
                        }
                    } label: {
                        Text("Location")
                    }
                    .pickerStyle(.automatic)
                }
                .navigationTitle("")
                .toolbar {
                    ToolbarItemGroup(placement: .topBarTrailing) {
                        Button("Save") {
                            // Reset sheet presentation height
                            pantryItemSheetPresentationSelection = .height(250)
                            dismiss()
                        }
                    }
                }
            }
        }
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    Group {
        PantryItemSheet(
            pantryItem: PantryItem(
                name: "Beef rib-eye steak",
                quantity: 1,
                expirationDate: .now,
                enabledReminder: false,
                expirationDateReminderDays: 0,
                location: .fridge,
                category: .beef
            ),
            pantryItemSheetPresentationSelection: .constant(.height(250))
        )
        .border(.red)
        .frame(height: 250)
        
        PantryItemSheet(
            pantryItem: PantryItem(
                name: "Beef rib-eye steak",
                quantity: 1,
                expirationDate: .now,
                enabledReminder: false,
                expirationDateReminderDays: 0,
                location: .fridge,
                category: .beef
            ),
            pantryItemSheetPresentationSelection: .constant(.large)
        )
        .border(.red)
    }
}
