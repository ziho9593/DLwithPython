//
//  DetailViewController.swift
//  BountyList
//
//  Created by 한지호 on 2021/05/30.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var ImgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
    var name: String?
    var bounty: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        if let name = self.name, let bounty = self.bounty {
            let img = UIImage(named: "\(name).jpg")
            ImgView.image = img
            nameLabel.text = name
            bountyLabel.text = "\(bounty)"
        }
    }
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
