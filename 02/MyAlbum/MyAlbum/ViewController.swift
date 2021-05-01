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
    
    @IBAction func showAlret(_ sender: Any) {
        let alret = UIAlertController(title: "Hello", message: "My First App!!", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alret.addAction(action)
        present(alret, animated: true, completion: nil)
    }
    
    @IBAction func challenge(_ sender: Any) {
        let alret = UIAlertController(title: "도오오저언입니다.", message: "도전 과제는 너무 행복해!", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alret.addAction(action)
        present(alret, animated: true, completion: nil)
    }
}
