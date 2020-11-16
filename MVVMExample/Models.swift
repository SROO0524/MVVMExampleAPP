//
//  Models.swift
//  MVVMExample
//
//  Created by 김믿음 on 2020/11/16.
//

import Foundation

enum Gender {
    case male, female, unspecified
}


//    MARK: Struct
struct Person {
    let name: String
    let birthdate : Data?
    let middlename : String?
    let address : String?
    let gender : Gender
    
    var  userName : String = "DuaLipa"
    
    
    init(name: String,birthdate: Data? = nil,middlename: String? = nil,address : String? = nil,gender : Gender = .unspecified) {
        self.name = name
        self.birthdate = birthdate
        self.middlename = middlename
        self.address = address
        self.gender = gender
    }
}
