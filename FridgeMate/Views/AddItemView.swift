//
//  AddItemView.swift
//  FridgeMate
//
//  Created by Leo Espinal on 5/5/22.
//

import SwiftUI

struct AddItemView: View {
	@Environment(\.dismiss) private var dismiss
	@State private var itemName = ""
	@State private var targetConsumeByDate = Date()
	@State private var enableReminders = false
	@State private var reminderDate = Date()
	private let tomorrow = Date.now.addingTimeInterval(86400)
	private var reminderDateRange: ClosedRange<Date> {
		if reminderDate < targetConsumeByDate {
			return reminderDate...targetConsumeByDate
		} else {
			let newReminderDate = Date().addingTimeInterval(-86400)
			return newReminderDate...targetConsumeByDate
		}
	}

    var body: some View {
		ScrollView(showsIndicators: false) {
			VStack {
				Text("Item Info")
					.font(.title2)
					.fontWeight(.semibold)
					.foregroundColor(.blueColor)
					.padding(.top, 10)

				Image(systemName: "photo.fill")
					.resizable()
					.frame(maxWidth: .infinity)
					.frame(maxHeight: 350)
					.aspectRatio(contentMode: .fit)
					.foregroundColor(.blueColor)
					.cornerRadius(8)
					.padding(.leading, 16)
					.padding(.trailing, 16)
					.onTapGesture {
						print("Show camera screen")
					}

				VStack(alignment: .leading, spacing: 20) {
					// Name
					VStack(alignment: .leading, spacing: 5) {
						Text("Name")
							.foregroundColor(.textDarkGray)
							.fontWeight(.medium)
						TextField("Name", text: $itemName)
							.frame(height: 43)
							.padding(.leading, 16)
							.overlay(
								RoundedRectangle(cornerRadius: 13)
									.stroke(Color.blueColor, lineWidth: 1)
							)
					}

					// Consume by date picker
					DatePicker(selection: $targetConsumeByDate,
							   in: tomorrow...,
							   displayedComponents: .date) {
						Text("Consume by")
							.foregroundColor(.textDarkGray)
							.fontWeight(.medium)
					}

					// Reminders
					HStack {
						Text("Enable reminders")
							.foregroundColor(.textDarkGray)
							.fontWeight(.medium)
						Spacer()
						Toggle("", isOn: $enableReminders)
							.tint(.accentOrange)
					}

					// Show or hide the reminder date picker
					if enableReminders {
						DatePicker(selection: $reminderDate,
								   in: reminderDateRange,
								   displayedComponents: .date) {
							Text("Remind me by")
								.foregroundColor(.textDarkGray)
								.fontWeight(.medium)
						}
					}

					// Food category buttons
					VStack(alignment: .leading, spacing: 10) {
						Text("Select a category")
							.foregroundColor(.textDarkGray)
							.fontWeight(.medium)
						HStack {
							FoodCategoryButton(categoryName: "Dairy")
							FoodCategoryButton(categoryName: "Meat")
							FoodCategoryButton(categoryName: "Fruit")
						}
						HStack {
							FoodCategoryButton(categoryName: "Vegetables")
							FoodCategoryButton(categoryName: "Grains")
							FoodCategoryButton(categoryName: "Fish")
						}
					}


				}
				.padding(.leading, 16)
				.padding(.trailing, 16)


				Spacer()
					.frame(maxWidth: .infinity)
					.frame(height: 40)

				// Save button
				CapsuleButton(title: "Save", color: .accentOrange, action: .constant({
					print("Save item")
					// TODO: Save the item to CoreData
					dismiss()
				}))

				Spacer()
			}
		}
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
		ForEach(PreviewDevices.devices, id: \.self) { deviceName in
			AddItemView()
				.previewDevice(PreviewDevice(rawValue: deviceName))
				.previewDisplayName(deviceName)
		}
    }
}
