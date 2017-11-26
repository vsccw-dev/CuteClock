//
//  NewAlertViewController.swift
//  CuteClock
//
//  Created by vsccw on 2017/11/26.
//  Copyright © 2017年 vsccw. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RealmManager

class NewAlertViewController: UIViewController {
  
    @IBOutlet weak var doneItem: UIBarButtonItem!
    @IBOutlet weak var dismissItem: UIBarButtonItem!
    @IBOutlet weak var datePicker: UIDatePicker!
    
  let disposeBag = DisposeBag()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    dismissItem.rx.tap
      .throttle(0.2, scheduler: MainScheduler.instance)
      .subscribe(onNext: { [weak self] in
        self?.navigationController?.dismiss(animated: true, completion: nil)
      })
      .disposed(by: disposeBag)
    
    let tap = doneItem.rx.tap
    tap.throttle(0.2, scheduler: MainScheduler.instance)
      .map({ [weak self] () -> Date? in
        guard let sSelf = self else { return nil }
        return sSelf.datePicker.date
      })
      .subscribe(onNext: { (date) in
        guard let date = date else { return }
        let alert = Alert(date: date)
        RealmManager.current.addAlert(alert)
      })
    .disposed(by: disposeBag)
  }
  
  deinit {
    debugPrint("\(self.classForCoder) is deinit.")
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
  }
  
}
