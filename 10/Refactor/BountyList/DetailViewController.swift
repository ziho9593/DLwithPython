//
//  DetailViewController.swift
//  BountyList
//
//  Created by 한지호 on 2021/05/30.
//

import UIKit

class DetailViewController: UIViewController {
    
    // MVVM
    
    // Model
    // - BountyInfo
    // > BountyInfo 만들기
    
    // View
    // - imgView, nameLabel, bountyLabel
    // > view들은 viewModel을 통해서 구성
    
    // ViewModel
    // - DetailViewModel
    // - DetailViewModel를 만들고, 뷰 레이어에서 필요한 메서드 만들기
    // > 모델을 갖고 있기 ,, BountyInfo 들
    
    @IBOutlet weak var ImgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
    let viewModel = DetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {
        
        if let bountyInfo = viewModel.bountyInfo {
            ImgView.image = bountyInfo.image
            nameLabel.text = bountyInfo.name
            bountyLabel.text = "\(bountyInfo.bounty)"
        }
    }
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

class DetailViewModel {
    var bountyInfo: BountyInfo?

    func update(model: BountyInfo?) {
        bountyInfo = model
    }
}
