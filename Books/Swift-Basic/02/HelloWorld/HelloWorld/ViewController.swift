//
//  ViewController.swift
//  HelloWorld
//
//  Created by Jiho on 2022/07/12.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var lblHello: UILabel!        // 출력 레이블용 아웃렛 변수
    @IBOutlet var txtName: UITextField!     // 이름 입력용 아웃렛 변수
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnSend(_ sender: UIButton) {
        // "Hello, "라는 문자열과 txtName.text의 문자열을 결합하여 lblHello.text에 넣음
        lblHello.text = "Hello, " + txtName.text!
    }
}

