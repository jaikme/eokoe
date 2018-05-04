//
//  UsersModel.swift
//  EoKoe
//
//  Created by Jaime Costa Marques on 04/05/18.
//  Copyright © 2018 Jaime Costa Marques. All rights reserved.
//

import Foundation

struct Users: Codable {
    let results: [Result]

    init?(data: Data) {
        guard let me = try? JSONDecoder().decode(Users.self, from: data) else { return nil }
        self = me
    }
}

struct Result: Codable {
    let id: Int
    let bio: [String: String]
    let picture: [String: String]
}
