//
//  AddPantryItemSheet.swift
//  FridgeMate
//
//  Created by Leo Espinal on 8/21/24.
//

import SwiftUI

struct AddPantryItemSheet: View {
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    @State private var name: String = ""
    @State private var expirationDate: Date = .now
    @State private var quantity = 1
    @State private var enableReminders = false
    @State private var expirationDateReminderDays = ""
    @State private var foodLocation: FoodLocation = .fridge
    @State private var foodCategory: FoodCategory = .beef
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                DatePicker("Expiration Date", selection: $expirationDate, displayedComponents: .date)
                Picker(selection: $quantity) {
                    ForEach(1...99, id: \.self) {
                        Text("\($0)")
                            .tag("")
                    }
                } label: {
                    Text("Quantity")
                }
                .pickerStyle(.automatic)
                Toggle(isOn: $enableReminders, label: {
                    Text("Enable Reminders")
                })
                if enableReminders {
                    Picker(selection: $expirationDateReminderDays) {
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
                Picker(selection: $foodCategory) {
                    ForEach(FoodCategory.allCases, id: \.self) { foodCategory in
                        Text(foodCategory.rawValue)
                            .tag("")
                    }
                } label: {
                    Text("Category")
                }
                .pickerStyle(.automatic)
                
                Picker(selection: $foodLocation) {
                    ForEach(FoodLocation.allCases, id: \.self) { foodLocation in
                        Text(foodLocation.rawValue)
                            .tag("")
                    }
                } label: {
                    Text("Location")
                }
                .pickerStyle(.automatic)
            }
            .navigationTitle("New Pantry Item")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button("Save") {
                        let pantryItem = PantryItem(
                            name: name,
                            quantity: quantity,
                            expirationDate: expirationDate,
                            enabledReminder: enableReminders,
                            expirationDateReminderDays: Int(expirationDateReminderDays) ?? .zero,
                            location: foodLocation.rawValue,
                            category: foodCategory.rawValue
                        )
                        context.insert(pantryItem)
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    AddPantryItemSheet()
}
