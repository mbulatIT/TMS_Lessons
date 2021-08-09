//
//  PushNotificationsViewController.swift
//  Lesson_31
//
//  Created by Maxim Bulat on 09.08.2021.
//

import UIKit
import UserNotifications

class PushNotificationsViewController: UIViewController {
    
    @IBAction func pushButtonPressed(_ sender: UIButton) {
        let notificationCenter = UNUserNotificationCenter.current()
        
        notificationCenter.requestAuthorization(options: [.alert, .sound, .badge]) { (granted, error) in
            if granted {
                let content = UNMutableNotificationContent()
                content.title = "First notification"
                content.body = "Description of my first notification. Amazing!"
                
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: true)
                
                let id = UUID().uuidString
                let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)
                
                
                notificationCenter.add(request) { (error) in
                    print(error?.localizedDescription)
                }
            } else {
                print("No push notifications permissions")
            }
        }
    }
}
