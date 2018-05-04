//
//  UsersListController.swift
//  EoKoe
//
//  Created by Jaime Costa Marques on 04/05/18.
//  Copyright © 2018 Jaime Costa Marques. All rights reserved.
//

import UIKit


final class UsersListController : UIViewController {
    
    // MARK: - Properties
    private var shouldShowStatusBar: Bool = true
    private lazy var presenter: UsersListPresenter = {
        return UsersListPresenter(controller: self)
    }()
    var interactor: UsersListInteractor?
    
    // MARK: - Outlets
    @IBOutlet private weak var tableView: UITableView!

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
        fetchUsers()
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
        presenter = UsersListPresenter(controller: self)
        
        let interactor = UsersListInteractor()
            interactor.presenter = presenter
        
        self.interactor = interactor
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

// MARK: Data handlers

extension UsersListController {
    
    func fetchUsers() {
        DispatchQueue.global(qos: .background).async {
            self.interactor?.loadUsers()
        }
    }
}
