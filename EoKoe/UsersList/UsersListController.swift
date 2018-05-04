//
//  UsersListController.swift
//  EoKoe
//
//  Created by Jaime Costa Marques on 04/05/18.
//  Copyright © 2018 Jaime Costa Marques. All rights reserved.
//

import UIKit

protocol UsersListDisplayMethods: class {
    func diplayFetchedUsers(results: [Result])
    var list: [Result] { get }
}

final class UsersListController : UIViewController {
    
    // MARK: - Properties
    internal var usersListModel = [Result]()
    private var shouldShowStatusBar: Bool = true
    private lazy var presenter: UsersListPresenter = {
        return UsersListPresenter(controller: self)
    }()
    internal let dataSource = UsersListDataSource()
    internal let delegate = UsersListDelegate()
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
        setupDataSource()
        setupDelegate()
    }
    
    private func registerCells() {
        tableView.register(cellNib: UsersListCell.self)
    }
    
    private func setupDataSource() {
        dataSource.view = self
        tableView.dataSource = dataSource
    }
    
    private func setupDelegate() {
        delegate.view = self
        tableView.delegate = delegate
    }
    
}

// MARK: Data handlers

extension UsersListController: UsersListDisplayMethods {
    
    var list: [Result] {
        return self.usersListModel
    }
    
    func diplayFetchedUsers(results: [Result]) {
        self.usersListModel = results
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    func fetchUsers() {
        DispatchQueue.global(qos: .background).async {
            self.interactor?.loadUsers()
        }
    }
}
