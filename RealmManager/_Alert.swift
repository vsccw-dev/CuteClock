//
//  Clock.swift
//  ClockModel
//
//  Created by vsccw on 2017/11/26.
//  Copyright © 2017年 vsccw. All rights reserved.
//

import UIKit
import Realm
import RealmSwift
import RxSwift

public class _Alert: Object {
  
  var alertTimeInterval: TimeInterval { return _alert_time_interval }
  var clockDate: Date? { return _clock_date }
  
  @objc dynamic var _id = ""
  @objc dynamic var _alert_time_interval: TimeInterval = 0.0
  @objc dynamic var _clock_date: Date? = nil
  
  override public static func primaryKey() -> String? {
    return "_id"
  }
  
  var toAlert: Alert {
    return Alert(clockTimeInterval: alertTimeInterval, clockDate: clockDate)
  }
}
