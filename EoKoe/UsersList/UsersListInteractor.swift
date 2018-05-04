//
//  UsersListInteractor.swift
//  EoKoe
//
//  Created by Jaime Costa Marques on 04/05/18.
//  Copyright © 2018 Jaime Costa Marques. All rights reserved.
//

import UIKit

final class UsersListInteractor {
    
    // MARK: - Properties
    
    var presenter: UsersListView?
    
    
    // MARK: Object lifecycle
    
    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(UsersListInteractor.loadUsers), name: DefaultsNotifications.reload, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    
}

// MARK: Methods

extension UsersListInteractor {
    
    @objc func loadUsers() {
        DataService.usersList(with: OffsetModel(start: 0, limit: 10)) { (response) in
            
        }
    }
}
