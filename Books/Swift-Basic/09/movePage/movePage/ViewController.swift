//
//  ViewController.swift
//  movePage
//
//  Created by Jiho on 2022/07/24.
//

import UIKit

let NUM_PAGE = 10

class ViewController: UIViewController {
    @IBOutlet var lblNumber: UILabel!
    @IBOutlet var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        pageControl.numberOfPages = NUM_PAGE
        pageControl.currentPage = 0
        
        pageControl.pageIndicatorTintColor = UIColor.green
        pageControl.currentPageIndicatorTintColor = UIColor.red
    }

    @IBAction func pageChange(_ sender: UIPageControl) {
        lblNumber.text = String(pageControl.currentPage + 1)
    }
    
}

