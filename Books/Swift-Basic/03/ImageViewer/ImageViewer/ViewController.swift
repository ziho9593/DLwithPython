//
//  ViewController.swift
//  ImageViewer
//
//  Created by Jiho on 2022/07/13.
//

import UIKit

class ViewController: UIViewController {
    var numImage = 1
    var maxImage = 6
    
    @IBOutlet var imgView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imgView.image = UIImage(named: "1.png")
    }

    @IBAction func btnBefore(_ sender: UIButton) {
        numImage -= 1
        if (numImage < 1) {
            numImage = maxImage
        }
        
        let imageName = String(numImage) + ".png"
        imgView.image = UIImage(named: imageName)
    }
    
    @IBAction func btnAfter(_ sender: UIButton) {
        numImage += 1
        if (numImage > maxImage) {
            numImage = 1
        }
        
        let imageName = String(numImage) + ".png"
        imgView.image = UIImage(named: imageName)
    }
}

