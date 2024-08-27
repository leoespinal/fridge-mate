//
//  PantryView.swift
//  FridgeMate
//
//  Created by Leo Espinal on 8/20/24.
//

import SwiftUI
import SwiftData

struct PantryView: View {
    @Query var pantryItems: [PantryItem]
    @State private var filterType: PantryFilterType = .all
    
    init() {
//        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color.blueColor)]
//        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color.blueColor)]
    }
    
    var body: some View {
        NavigationStack {
            if !pantryItems.isEmpty {
                PantryFilterView(filterType: $filterType)
                    .padding(.top, 20)
            }

            PantryList(filterType: filterType)
        }
    }
}
