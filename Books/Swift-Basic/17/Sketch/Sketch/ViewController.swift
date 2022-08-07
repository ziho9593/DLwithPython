//
//  ViewController.swift
//  Sketch
//
//  Created by Jiho on 2022/08/07.
//

import UIKit

class ViewController: UIViewController {
    
    var lastPoint: CGPoint!
    var lineSize: CGFloat = 2.0
    var lineColor = UIColor.black.cgColor
    
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var txtLineSize: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        txtLineSize.text = String(Int(lineSize))
    }

    @IBAction func cleaerImageView(_ sender: UIButton) {
        imgView.image = nil
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first! as UITouch
        
        lastPoint = touch.location(in: imgView)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIGraphicsBeginImageContext(imgView.frame.size)
        UIGraphicsGetCurrentContext()?.setStrokeColor(lineColor)
        UIGraphicsGetCurrentContext()?.setLineCap(CGLineCap.round)
        UIGraphicsGetCurrentContext()?.setLineWidth(lineSize)
        
        let touch = touches.first! as UITouch
        let currPoint = touch.location(in: imgView)
        
        imgView.image?.draw(in: CGRect(x: 0, y: 0, width: imgView.frame.size.width, height: imgView.frame.size.height))
        
        UIGraphicsGetCurrentContext()?.move(to: CGPoint(x: lastPoint.x, y: lastPoint.y))
        UIGraphicsGetCurrentContext()?.addLine(to: CGPoint(x: currPoint.x, y: currPoint.y))
        UIGraphicsGetCurrentContext()?.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        lastPoint = currPoint
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIGraphicsBeginImageContext(imgView.frame.size)
        UIGraphicsGetCurrentContext()?.setStrokeColor(lineColor)
        UIGraphicsGetCurrentContext()?.setLineCap(CGLineCap.round)
        UIGraphicsGetCurrentContext()?.setLineWidth(lineSize)
        
        imgView.image?.draw(in: CGRect(x: 0, y: 0, width: imgView.frame.size.width, height: imgView.frame.size.height))
        
        UIGraphicsGetCurrentContext()?.move(to: CGPoint(x: lastPoint.x, y: lastPoint.y))
        UIGraphicsGetCurrentContext()?.addLine(to: CGPoint(x: lastPoint.x, y: lastPoint.y))
        UIGraphicsGetCurrentContext()?.strokePath()
        
        imgView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            imgView.image = nil
        }
    }
    
    @IBAction func changeLineColorBlack(_ sender: UIButton) {
        lineColor = UIColor.black.cgColor
    }
    
    @IBAction func changeLineColorRed(_ sender: UIButton) {
        lineColor = UIColor.red.cgColor
    }
    
    @IBAction func changeLineColorGreen(_ sender: UIButton) {
        lineColor = UIColor.green.cgColor
    }
    
    @IBAction func changeLineColorBlue(_ sender: UIButton) {
        lineColor = UIColor.blue.cgColor
    }
    
    @IBAction func txtDidEndOnExit(_ sender: UITextField) {
        lineSize = CGFloat(Int(txtLineSize.text!)!)
    }
    
    @IBAction func txtEditChange(_ sender: UITextField) {
        if txtLineSize.text != "" {
            lineSize = CGFloat(Int(txtLineSize.text!)!)
        }
    }
    
    @IBAction func txtTouchDown(_ sender: UITextField) {
        txtLineSize.selectAll(UITextField.self)
    }
    
}

