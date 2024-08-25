//
//  PantryItem.swift
//  FridgeMate
//
//  Created by Leo Espinal on 8/20/24.
//

import Foundation
import SwiftData
import SwiftUI

enum FoodCategory: String, CaseIterable, Codable {
    case beef = "Beef"
    case poultry = "Poultry"
    case seafood = "Seafood"
    case veggies = "Vegetables"
    case fruits = "Fruits"
    case dairy = "Dairy"
    case grains = "Grains"
    case drinks = "Drinks"
    case sweets = "Sweets"

    var icon: String {
        switch self {
        case .beef:
            return "steak"
        case .poultry:
            return "chicken"
        case .seafood:
            return "sushi"
        case .veggies:
            return "broccoli"
        case .fruits:
            return "strawberry"
        case .dairy:
            return "cheese"
        case .grains:
            return "toast"
        case .drinks:
            return "drink"
        case .sweets:
            return "cookie"
        }
    }
    
    var iconTint: Color {
        switch self {
        case .beef:
            return .brown
        case .poultry:
            break
        case .seafood:
            break
        case .veggies:
            break
        case .fruits:
            break
        case .dairy:
            break
        case .grains:
            break
        case .drinks:
            break
        case .sweets:
            break
        }
        return .brown
    }
}

enum FoodLocation: String, CaseIterable, Codable {
    case fridge = "Fridge"
    case freezer = "Freezer"
    case dryPantry = "Dry Pantry"
}

@Model
class PantryItem {
    var name: String
    var quantity: Int
    var dateAdded: Date
    var expirationDate: Date
    var enabledReminder: Bool
    var expirationDateReminderDays: Int // Number of days before expiration user wants to be reminded
    var location: FoodLocation
    var foodCategory: FoodCategory

    var subtitle: String {
        if isExpiring {
            return numberOfDaysToExpiration == 1 ? "Expiring in \(numberOfDaysToExpiration) day!" : "Expiring in \(numberOfDaysToExpiration) days!"
        } else {
            return numberOfDaysInPantry == 1 ? "\(numberOfDaysInPantry) day in" : "\(numberOfDaysInPantry) days in"
        }
    }
    
    var numberOfDaysInPantry: Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: dateAdded, to: .now)
        guard let daysSinceAdded = components.day else { return 0 }
        return daysSinceAdded
    }
    
    var numberOfDaysToExpiration: Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: .now, to: expirationDate)
        guard let daysToExpiration = components.day else { return 0 }
        return daysToExpiration
    }
    
    var isExpiring: Bool {
        // If number of days prior to the expiration date is the same as the current day then its expiring
        if let date = Calendar.current.date(byAdding: .day, value: -expirationDateReminderDays, to: expirationDate) {
            let calendar = Calendar.current
            let reminderDayPriorToExpirationDate = calendar.component(.day, from: date)
            let currentDay = calendar.component(.day, from: .now)
            return reminderDayPriorToExpirationDate == currentDay
        }
        return false
    }
    
    var hasExpired: Bool {
        return expirationDate < .now
    }
    
    init(name: String,
         quantity: Int,
         dateAdded: Date = .now,
         expirationDate: Date,
         enabledReminder: Bool,
         expirationDateReminderDays: Int,
         location: FoodLocation,
         category: FoodCategory) {
        self.name = name
        self.quantity = quantity
        self.dateAdded = dateAdded
        self.expirationDate = expirationDate
        self.enabledReminder = enabledReminder
        self.expirationDateReminderDays = expirationDateReminderDays
        self.location = location
        self.foodCategory = category
    }
}
