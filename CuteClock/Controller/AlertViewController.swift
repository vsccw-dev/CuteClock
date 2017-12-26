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
  
  var allAlert: [Alert]? {
    didSet {
      tableView.reloadData()
    }
  }
  
  let disposeBag = DisposeBag()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if #available(iOS 11.0, *) {
      tableView.contentInsetAdjustmentBehavior = .never
    } else {
      automaticallyAdjustsScrollViewInsets = false
    }
    
    tableView.contentInset.top = 70
    
    Notification.shared.requestPermission { (granted) in
      debugPrint(granted)
    }
  }
  
  override func viewWillAppear(_ animated: Bool) {
//    navigationController?.setNavigationBarHidden(true, animated: animated)
    super.viewWillAppear(animated)
    allAlert = RealmManager.current.allAlert()
  }
  
  override func viewWillDisappear(_ animated: Bool) {
//    navigationController?.setNavigationBarHidden(false, animated: animated)
    super.viewWillDisappear(animated)
  }
}


extension AlertViewController: UITableViewDataSource {
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    let count = allAlert?.count ?? 0
    return count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "alertCell")
//    let currentAlert = allAlert?[indexPath.row]
//    cell?.textLabel?.text = "\(currentAlert?.clockTimeInterval ?? 0)"
    return cell!
  }
}

extension AlertViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 80.0
  }
  
  func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    return CGFloat.leastNormalMagnitude
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return CGFloat.leastNormalMagnitude
  }
}
