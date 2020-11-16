//
//  PersonFollowingTableViewCellViewModel.swift
//  MVVMExample
//
//  Created by 김믿음 on 2020/11/16.
//

import UIKit

struct PersonFollowingTableViewCellViewModel {
    let name : String
    let userName : String
    var currentlyFollowing : Bool
    let image: UIImage?
    
    init(with model: Person) {
        name = model.name
        userName = model.userName
        currentlyFollowing = false
        image = UIImage(systemName: "person")
    }
}
