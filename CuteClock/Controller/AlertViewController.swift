//
//  AlertViewController.swift
//  CuteClock
//
//  Created by vsccw on 2017/11/26.
//  Copyright © 2017年 vsccw. All rights reserved.
//

import UIKit
import RxSwift
import RealmManager

class AlertViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var addAlertItem: UIBarButtonItem!
  
  let disposeBag = DisposeBag()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    RealmManager.current.allAlert()
      .subscribe(onNext: { (alerts) in
        debugPrint(alerts)
      })
      .disposed(by: disposeBag)
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
}
