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

class _Alert: Object {
  
  var alertTimeInterval: TimeInterval { return _alert_time_interval }
  var clockDate: Date? { return _clock_date }
  var createAt: Int { return _create_at }
  var updateAt: TimeInterval { return _update_at }
  
  @objc dynamic var _alert_time_interval: TimeInterval = 0.0
  @objc dynamic var _clock_date: Date? = nil
  @objc dynamic var _create_at: Int = 0
  @objc dynamic var _update_at: TimeInterval = 0.0
  
  override public static func primaryKey() -> String? {
    return "_create_at"
  }
  
  var toAlert: Alert {
    return Alert(clockTimeInterval: alertTimeInterval, clockDate: clockDate)
  }
}
