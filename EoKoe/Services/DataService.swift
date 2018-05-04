//
//  DataService.swift
//  EoKoe
//
//  Created by Jaime Costa Marques on 04/05/18.
//  Copyright © 2018 Jaime Costa Marques. All rights reserved.
//

import Foundation

final class DataService {
    
    static func usersList(with offsetModel: OffsetModel, completion: @escaping (Users) -> Void) {
        Provider.shared.EokoeTestProvider.request(.users(offsetModel)) { result in
            switch result {
            case let .success(moyaResponse):
                do {
                    let usersResults = try moyaResponse.tryParseUsers()
                    completion(usersResults)
                }
                catch let error {
                    Logger.shared.log(for: .error(message: "Error load or parse usersList: \(error.localizedDescription)"))
                }
            case let .failure(error):
                print(error.errorDescription as Any)
            }
        }
    }

}
