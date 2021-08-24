//
//  SchedulingLocalNotifications.swift
//  HotProspects
//
//  Created by Sergio Sepulveda on 2021-08-24.
//

import UserNotifications
import SwiftUI

struct SchedulingLocalNotifications: View {
    var body: some View {
        VStack {
            Button("Request Permission") {
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        print("All set!")
                    } else if let error = error {
                        print(error.localizedDescription)
                    }
                }
            }
            Button("Schedule Notification") {
                let content = UNMutableNotificationContent()
                content.title = "Feed the cat"
                content.subtitle = "It looks hungry"
                content.sound = UNNotificationSound.default
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                UNUserNotificationCenter.current().add(request)
            }
        }
            
    }
}

struct SchedulingLocalNotifications_Previews: PreviewProvider {
    static var previews: some View {
        SchedulingLocalNotifications()
    }
}
