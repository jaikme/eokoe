//
//  UsersModel.swift
//  EoKoe
//
//  Created by Jaime Costa Marques on 04/05/18.
//  Copyright © 2018 Jaime Costa Marques. All rights reserved.
//

import Foundation
//import ObjectMapper


struct Users: Codable {
    let results: [Result]
    
    init?(data: Data) {
        guard let me = try? JSONDecoder().decode(Users.self, from: data) else { return nil }
        self = me
    }
}
//
//// MARK: Convenience initializers
//
//extension Users {
//    init?(data: Data) {
//        guard let me = try? JSONDecoder().decode(Users.self, from: data) else { return nil }
//        self = me
//    }
//
//    init?(_ json: String, using encoding: String.Encoding = .utf8) {
//        guard let data = json.data(using: encoding) else { return nil }
//        self.init(data: data)
//    }
//
//    init?(fromURL url: String) {
//        guard let url = URL(string: url) else { return nil }
//        guard let data = try? Data(contentsOf: url) else { return nil }
//        self.init(data: data)
//    }
//
//    var jsonData: Data? {
//        return try? JSONEncoder().encode(self)
//    }
//
//    var json: String? {
//        guard let data = self.jsonData else { return nil }
//        return String(data: data, encoding: .utf8)
//    }
//}


struct Result: Codable {
    let id: Int
    //let bio: String
    //let thumbnail: String
}


//class UserModel: Mappable {
//
//    @objc dynamic var id = ""
//    @objc dynamic var bio = ""
//    @objc dynamic var thumbnail = ""
//
//    required convenience init?(map: Map) {
//        self.init()
//    }
//
//    func mapping(map: Map) {
//        id <- map["id"]
//        bio <- map["bio"]
//        thumbnail <- map["picture.thumbnail"]
//    }
//
//
//
//}
