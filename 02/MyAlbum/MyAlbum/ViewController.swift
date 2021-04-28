//
//  ViewController.swift
//  MyAlbum
//
//  Created by 한지호 on 2021/04/27.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func Hello(_ sender: Any) {
        let alret = UIAlertController(title: "Hello", message: "My First App!!", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alret.addAction(action)
        present(alret, animated: true, completion: nil)
    }
}
