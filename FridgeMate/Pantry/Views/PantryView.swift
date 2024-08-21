//
//  PantryView.swift
//  FridgeMate
//
//  Created by Leo Espinal on 8/20/24.
//

import SwiftUI
import SwiftData

struct PantryView: View {
    @Environment(\.modelContext) var context
    @State private var showAddPantryItemSheet = false
    @Query(sort: \PantryItem.dateAdded) var pantryItems: [PantryItem]
    @State private var pantryItemToEdit: PantryItem?
    
    init() {
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color.blueColor)]
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color.blueColor)]
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(pantryItems) { pantryItem in
                    PantryItemCard(
                        imageName: pantryItem.icon,
                        title: pantryItem.title,
                        subtitle: pantryItem.subtitle,
                        quanity: pantryItem.quantity,
                        location: pantryItem.location,
                        isExpiringSoon: pantryItem.isExpiring
                    )
                    .listRowSeparator(.hidden)
                    .onTapGesture {
                        pantryItemToEdit = pantryItem
                    }
                }
                .onDelete { indexSet in
                    for index in indexSet {
                        context.delete(pantryItems[index])
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle(Text("My Pantry"))
            .navigationBarTitleDisplayMode(.large)
            .sheet(isPresented: $showAddPantryItemSheet) {
                AddPantryItemSheet()
            }
            .sheet(item: $pantryItemToEdit) { pantryItem in
                UpdatePantryItemSheet(pantryItem: pantryItem)
            }
            .toolbar {
                if !pantryItems.isEmpty {
                    Button("Add Pantry Item", systemImage: "plus") {
                        showAddPantryItemSheet = true
                    }
                    .tint(Color.accentOrange)
                    .fontWeight(.bold)
                }
            }
            .overlay {
                if pantryItems.isEmpty {
                    ContentUnavailableView(label: {
                        Image("man-shopping")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 205, height: 205)
                        Text("Your Fridge is Empty")
                            .font(.system(size: 20, weight: .bold))
                            .foregroundStyle(Color.textDarkGray)
                    }, description: {
                        Text("Grab some groceries and start tracking what's in your pantry")
                            .font(.system(size: 16, weight: .regular))
                            .foregroundStyle(Color.textLightGray)
                            .multilineTextAlignment(.center)
                    }, actions: {
                        Button("Add Item") { showAddPantryItemSheet = true }
                            .foregroundStyle(Color.accentOrange)
                            .font(.callout)
                            .fontWeight(.semibold)
                    })
                }
            }
        }
    }
}

#Preview {
    PantryView()
}
