//
//  ViewController.swift
//  AlertM
//
//  Created by Jiho on 2022/07/15.
//

import UIKit

class ViewController: UIViewController {
    let timeSelector:  Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    var count = 0
    var alarmTime: String?
    var alertFlag = false
    
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblSelectTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

    @IBAction func timePicker(_ sender: UIDatePicker) {
        let timePickerView = sender
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEEE"
        lblSelectTime.text = "선택시간: " + formatter.string(from: timePickerView.date)
        formatter.dateFormat = "hh:mm aaa"
        alarmTime = formatter.string(from: timePickerView.date)
    }
    
    @objc func updateTime() {
        let date = NSDate()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEEE"
        lblCurrentTime.text = "현재시간: " + formatter.string(from: date as Date)
        
        formatter.dateFormat = "hh:mm aaa"
        let currentTime = formatter.string(from: date as Date)
        if (alarmTime == currentTime) {
            if !alertFlag {
                let lampOnAlert = UIAlertController(title: "알림", message: "설정된 시간입니다 !!!", preferredStyle: UIAlertController.Style.alert)
                let onAction = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertAction.Style.default, handler: nil)
                lampOnAlert.addAction(onAction)
                present(lampOnAlert, animated: true, completion: nil)
                alertFlag = true
            }
        } else {
            alertFlag = false
        }
    }
}

