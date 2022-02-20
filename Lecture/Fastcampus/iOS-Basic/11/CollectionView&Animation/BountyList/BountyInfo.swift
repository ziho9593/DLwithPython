//
//  BountyInfo.swift
//  BountyList
//
//  Created by 한지호 on 2021/06/03.
//

import UIKit

struct BountyInfo {
    let name: String
    let bounty: Int
    
    var image: UIImage? {
        return UIImage(named: "\(name).jpg")
    }
    
    init(name: String, bounty:Int) {
        self.name = name
        self.bounty = bounty
    }
}
