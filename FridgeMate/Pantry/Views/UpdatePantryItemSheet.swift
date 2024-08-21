//
//  UpdatePantryItemSheet.swift
//  FridgeMate
//
//  Created by Leo Espinal on 8/21/24.
//

import SwiftUI

struct UpdatePantryItemSheet: View {
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    @Bindable var pantryItem: PantryItem
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Item Name", text: $pantryItem.title)
                DatePicker("Date", selection: $pantryItem.dateAdded, displayedComponents: .date)
                DatePicker("Consume by", selection: $pantryItem.targetConsumptionDate, displayedComponents: .date)
            }
            .navigationTitle("Update Pantry Item")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItemGroup(placement: .topBarTrailing) {
                    Button("Done") { dismiss() }
                }
            }
        }
    }
}
#Preview {
    UpdatePantryItemSheet(
        pantryItem: PantryItem(
            icon: "fork.knife",
            title: "Beef",
            subtitle: "Test subtitle",
            quantity: "300 g",
            dateAdded: .now,
            targetConsumptionDate: .now,
            isExpiring: false,
            location: "Fridge")
    )
}
