//
//  AppDelegate.swift
//  CuteClock
//
//  Created by vsccw on 2017/11/26.
//  Copyright © 2017年 vsccw. All rights reserved.
//

import UIKit
import RealmManager

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    
    do {
      try RealmManager.current.setup(appName: "CuteClock", 1)
    } catch let error {
      debugPrint(error)
    }
    
    return true
  }
  
  func applicationWillResignActive(_ application: UIApplication) {
    
  }
  
  func applicationDidEnterBackground(_ application: UIApplication) {
    
  }
  
  func applicationWillEnterForeground(_ application: UIApplication) {
    
  }
  
  func applicationDidBecomeActive(_ application: UIApplication) {
    
  }
  
  func applicationWillTerminate(_ application: UIApplication) {
    
  }
  
}

