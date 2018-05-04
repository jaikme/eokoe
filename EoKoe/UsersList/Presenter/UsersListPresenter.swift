//
//  UsersListPresenter.swift
//  EoKoe
//
//  Created by Jaime Costa Marques on 04/05/18.
//  Copyright © 2018 Jaime Costa Marques. All rights reserved.
//

import Foundation

final class UsersListPresenter : UsersListView {
    
    private weak var controller: UsersListController?
    
    func showLoadedUsers(with items: Users) {
        self.controller?.diplayFetchedUsers(results: items.results)
    }

    public init(controller: UsersListController) {
        self.controller = controller
    }
}
