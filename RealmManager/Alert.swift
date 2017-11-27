//
//  Alert.swift
//  AlertModel
//
//  Created by vsccw on 2017/11/26.
//  Copyright © 2017年 vsccw. All rights reserved.
//

import UIKit

public struct Alert {
  
  public var clockTimeInterval: TimeInterval = 0
  public var clockDate: Date?
  
  init(clockTimeInterval: TimeInterval, clockDate: Date?) {
    self.clockDate = clockDate
    self.clockTimeInterval = clockTimeInterval
  }
  
  public init(date: Date) {
    self.clockTimeInterval = date.timeIntervalSince1970
    self.clockDate = date
  }

  var to_Alert: _Alert {
    let createAt = Int(Date().timeIntervalSince1970 * 1000)
    return _Alert(value: ["_alert_time_interval": clockTimeInterval,
                          "_clock_date": clockDate ?? Date(),
                          "_create_at": createAt])
  }
}
