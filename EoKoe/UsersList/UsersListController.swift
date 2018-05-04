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
    
    private var shouldShowStatusBar: Bool = true
    
    // MARK: Object lifecycle
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAppearance()
        setupTableView()
        updateStatusBar()
    }
    
}

// MARK: Status bar config

extension UsersListController {
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .slide
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override var prefersStatusBarHidden: Bool {
        return !shouldShowStatusBar
    }
    
    private func updateStatusBar(isVisible: Bool = true) {
        shouldShowStatusBar = isVisible
        UIView.animate(withDuration: 0.3) {
            self.setNeedsStatusBarAppearanceUpdate()
        }
    }
}

// MARK: Setups

extension UsersListController {
    
    private func setup() {

    }
    
    private func setupAppearance() {
        navigationController?.navigationBar.barTintColor = AppColors.usersListNavbarColor
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
