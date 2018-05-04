//
//  UsersListController.swift
//  EoKoe
//
//  Created by Jaime Costa Marques on 04/05/18.
//  Copyright © 2018 Jaime Costa Marques. All rights reserved.
//

import UIKit


final class UsersListController : UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: Object lifecycle
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
}

// MARK: Setups

extension UsersListController {
    
    private func setup() {

    }
    
    private func setupTableView() {
        tableView.estimatedRowHeight = 190
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.separatorStyle = .none
        tableView.tableFooterView?.isHidden = true
        registerCells()
    }
    
    private func registerCells() {
        
    }
    
}
