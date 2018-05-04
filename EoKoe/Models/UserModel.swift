//
//  UsersModel.swift
//  EoKoe
//
//  Created by Jaime Costa Marques on 04/05/18.
//  Copyright © 2018 Jaime Costa Marques. All rights reserved.
//

import Foundation
import ObjectMapper

class UserModel: Mappable {
    
    @objc dynamic var id = ""
    @objc dynamic var bio = ""
    @objc dynamic var thumbnail = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        bio <- map["bio"]
        thumbnail <- map["picture.thumbnail"]
    }
    


}
