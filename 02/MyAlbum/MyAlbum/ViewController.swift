//
//  ViewController.swift
//  MyAlbum
//
//  Created by 한지호 on 2021/04/27.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var priceLabel: UILabel!
    var currentValue = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        priceLabel.text = "₩ \(currentValue)"
    }
    
    @IBAction func showAlret(_ sender: Any) {
        let message = "가격은 \(currentValue) 입니다."
    
        let alret = UIAlertController(title: "Hello", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alret.addAction(action)
        present(alret, animated: true, completion: nil)
    
        let randomPrice = arc4random_uniform(10000) + 1
        currentValue = Int(randomPrice)
        priceLabel.text = "₩ \(currentValue)"
    }

}
