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
    @State private var date: Date = .now
    @State private var consumeByDate: Date = .now
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Item Name", text: $name)
                DatePicker("Date", selection: $date, displayedComponents: .date)
                DatePicker("Consume by", selection: $consumeByDate, displayedComponents: .date)
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
                            icon: "fork.knife",
                            title: name,
                            subtitle: "Test subtitle",
                            quantity: "300 g",
                            dateAdded: date,
                            targetConsumptionDate: consumeByDate,
                            isExpiring: false,
                            location: "Fridge"
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
