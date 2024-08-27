//
//  PushNotificationManager.swift
//  FridgeMate
//
//  Created by Leo Espinal on 8/26/24.
//

import Foundation
import UserNotifications

class PushNotificationManager {
    static let shared = PushNotificationManager()
    
    private init() {}
    
    func requestPushNotificationPermissions() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            if success {
                print("Notification permissions granted")
            } else if let error {
                print(error.localizedDescription)
            }
        }
    }
    
    func checkNotificationPermissions() {
        UNUserNotificationCenter.current().getNotificationSettings { [weak self] settings in
            switch settings.authorizationStatus {
            case .notDetermined:
                self?.requestPushNotificationPermissions()
            case .denied:
                // TODO: Direct user to settings to enable notifications
                break
            default:
                break
            }
        }
    }
    
    func scheduleNotification(with title: String, subtitle: String, reminderDate: Date) {
        let content = UNMutableNotificationContent()
        content.title = title
        content.subtitle = subtitle
        content.sound = UNNotificationSound.default
        // Show this notification on the day that the user would like to be reminded
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
}
