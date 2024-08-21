//
//  PantryItem.swift
//  FridgeMate
//
//  Created by Leo Espinal on 8/20/24.
//

import Foundation
import SwiftData

@Model
class PantryItem {
    var icon: String
    var title: String
    var subtitle: String
    var quantity: String
    var dateAdded: Date
    var targetConsumptionDate: Date
    var isExpiring: Bool
    var location: String
    
    init(icon: String, title: String, subtitle: String, quantity: String, dateAdded: Date, targetConsumptionDate: Date, isExpiring: Bool, location: String) {
        self.icon = icon
        self.title = title
        self.subtitle = subtitle
        self.quantity = quantity
        self.dateAdded = dateAdded
        self.targetConsumptionDate = targetConsumptionDate
        self.isExpiring = isExpiring
        self.location = location
    }
}
