//
//  AppDelegate.swift
//  PushNotificationsProjectEO
//
//  Created by mcs on 11/5/19.
//  Copyright © 2019 EricOusouphan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
    print(deviceToken)
  }
  func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
    print(error.localizedDescription)
  }
  
}

