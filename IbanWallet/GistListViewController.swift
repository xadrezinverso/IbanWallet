//
//  GistListViewController.swift
//  IbanWallet
//
//  Created by Joao Garcia on 11/8/18.
//  Copyright © 2018 SBT. All rights reserved.
//

import UIKit
import RealmSwift
import Cartography

class GistListViewController: UIViewController {
    
    private var notificationToken: NotificationToken? = nil
    
    private lazy var gistListView: GistListView = {
        let view = GistListView(tableViewDelegate: self, tableViewDataSource: self)
        view.backgroundColor = .clear
        return view
    }()
    
    public var tableViewGists: [Gist]? {
        didSet {
            gistListView.reloadTableViewData()
        }
    }
    
    private var serviceManager: ServiceManager
    
    init(sharedServiceManager: ServiceManager) {
        serviceManager = sharedServiceManager
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func loadView() {
        super.loadView()
        setupView()
        setupLayout()
    }
    
    private func setupView() {
        view.addSubview(gistListView)
        view.backgroundColor = .yellow
        registerListener()
    }
    
    private func setupLayout() {
        constrain(gistListView) { view in
            guard let superview = view.superview else {
                return
            }
            view.edges == superview.edges
        }
    }
    
    private func registerListener() {
        notificationToken = serviceManager.gistsFromLocal()?.observe { (changes: RealmCollectionChange) in
            switch changes {
            case .initial, .update:
                // Results are now populated and can be accessed without blocking the UI
                self.populateTableView()
            case .error(let error):
                print("Error opening the Realm file on the background worker thread \(error)")
            }
        }
    }
    
    private func populateTableView() {
        guard let gists = serviceManager.gistsFromLocal() else {
            return
        }
        tableViewGists = Array(gists)
    }
}

extension GistListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewGists?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: GistListView.gistCellIdentifier, for:indexPath) as? GistListTableViewCell else {
            return GistListTableViewCell()
        }
        
        guard let gists = tableViewGists else {
            return GistListTableViewCell()
        }
        cell.configure(info: gists[indexPath.row])
        return cell
    }
}

extension GistListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectedGist = tableViewGists?[indexPath.row] else {
            return
        }
        
        let detailController = GistDetailViewController(gist: selectedGist)
        self.navigationController?.pushViewController(detailController, animated: true)
    }
}
