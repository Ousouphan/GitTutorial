//
//  ViewController.swift
//  PushNotificationsProjectEO
//
//  Created by mcs on 11/5/19.
//  Copyright © 2019 EricOusouphan. All rights reserved.
//

import UIKit
import UserNotifications

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    UNUserNotificationCenter.current().requestAuthorization(options: [.badge, .alert, .sound]) { [weak self] (authorized, error) in
      guard authorized, error == nil else { return }
      DispatchQueue.main.async {
           UIApplication.shared.registerForRemoteNotifications()
        self?.scheduleAlert()
      }
    }
  }
  func scheduleAlert() {
    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: true)
    let content = UNMutableNotificationContent()
    content.badge = 99
    content.title = "Here to piss you off"
    content.subtitle = "What does the fox say"
    content.sound = .defaultCritical
    let request = UNNotificationRequest(identifier: "TheCoolNotification", content: content, trigger: trigger)
    UNUserNotificationCenter.current().add(request) { (error) in
      print(error?.localizedDescription)
    }
  }
}

