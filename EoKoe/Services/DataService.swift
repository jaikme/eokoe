//
//  DataService.swift
//  EoKoe
//
//  Created by Jaime Costa Marques on 04/05/18.
//  Copyright © 2018 Jaime Costa Marques. All rights reserved.
//

import Foundation

final class DataService {
    
    static func usersList(with offsetModel: OffsetModel, completion: @escaping ([UserModel]) -> Void) {
        Provider.shared.EokoeTestProvider.request(.users(offsetModel)) { result in
            switch result {
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error.errorDescription as Any)
            }
        }
    }

}
