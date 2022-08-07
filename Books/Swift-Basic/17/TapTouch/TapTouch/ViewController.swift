//
//  ViewController.swift
//  TapTouch
//
//  Created by Jiho on 2022/08/07.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var lblMessage: UILabel!
    @IBOutlet var lblTapCount: UILabel!
    @IBOutlet var lblTouchCount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        
        lblMessage.text = "Touches Began"
        lblTapCount.text = String(touch.tapCount)
        lblTouchCount.text = String(touches.count)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        
        lblMessage.text = "Touches Moved"
        lblTapCount.text = String(touch.tapCount)
        lblTouchCount.text = String(touches.count)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        
        lblMessage.text = "Touches Ended"
        lblTapCount.text = String(touch.tapCount)
        lblTouchCount.text = String(touches.count)
    }

}

