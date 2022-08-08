//
//  ViewController.swift
//  GallerySwipePinch
//
//  Created by Jiho on 2022/08/08.
//

import UIKit

class ViewController: UIViewController {
    var images = ["01.png", "02.png", "03.png", "04.png", "05.png", "06.png"]
    
    @IBOutlet var imgView: UIImageView!
    @IBOutlet var pageControl: UIPageControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        pageControl.numberOfPages = images.count
        pageControl.currentPage = 0
        
        pageControl.pageIndicatorTintColor = UIColor.green
        pageControl.currentPageIndicatorTintColor = UIColor.red
        
        imgView.image = UIImage(named: images[0])
        
        let swpieLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swpieLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swpieLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
        
        let pinch = UIPinchGestureRecognizer(target: self, action: #selector(ViewController.doPinch(_:)))
        self.view.addGestureRecognizer(pinch)
    }

    @objc func respondToSwipeGesture(_ gesture: UISwipeGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.right:
                if pageControl.currentPage == 0 {
                    pageControl.currentPage = images.count - 1
                } else {
                    pageControl.currentPage -= 1
                }
            case UISwipeGestureRecognizer.Direction.left:
                if pageControl.currentPage == images.count - 1 {
                    pageControl.currentPage = 0
                } else {
                    pageControl.currentPage += 1
                }
            default:
                break
            }
            
            imgView.image = UIImage(named: images[pageControl.currentPage])
        }
    }
    
    @objc func doPinch(_ pinch: UIPinchGestureRecognizer) {
        imgView.transform = imgView.transform.scaledBy(x: pinch.scale, y: pinch.scale)
    }
    
    
}

