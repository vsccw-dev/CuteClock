//
//  Notification.swift
//  CuteClock
//
//  Created by vsccw on 2017/12/8.
//  Copyright © 2017年 vsccw. All rights reserved.
//

import UIKit
import UserNotifications

class Notification: NSObject {
  
  static let shared = Notification()
  
  func requestPermission(_ completion: ((Bool) -> Void)?) {
    if #available(iOS 10.0, *) {
      UNUserNotificationCenter.current().requestAuthorization(options: [.sound, .alert]) { (granted, _) in
        completion?(granted)
      }
    } else {
      let setting = UIUserNotificationSettings(types: [.alert, .sound], categories: nil)
      UIApplication.shared.registerUserNotificationSettings(setting)
      if let currentSetting = UIApplication.shared.currentUserNotificationSettings,
        currentSetting.types.contains(.alert) && currentSetting.types.contains(.sound) {
        completion?(true)
      } else {
        completion?(false)
      }
    }
  }
  
  func createNotificationAt(date: Date) {
    
  }
  
}
