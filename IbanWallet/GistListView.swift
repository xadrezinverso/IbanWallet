//
//  GistListView.swift
//  IbanWallet
//
//  Created by Joao Garcia on 11/8/18.
//  Copyright © 2018 SBT. All rights reserved.
//

import UIKit
import Cartography

class GistListView: UIView {
    
    static let gistCellIdentifier = "gistCell"
    
    private lazy var gistsTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    init(tableViewDelegate: UITableViewDelegate, tableViewDataSource: UITableViewDataSource) {
        super.init(frame: .zero)
        gistsTableView.delegate = tableViewDelegate
        gistsTableView.dataSource = tableViewDataSource
        setupView()
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(gistsTableView)
        registerTableViewCells()
    }
    
    private func setupLayout() {
        constrain(gistsTableView) { view in
            guard let superview = view.superview else {
                return
            }
            view.edges == superview.edges
        }
    }
    
    private func registerTableViewCells() {
        gistsTableView.register(GistListTableViewCell.self, forCellReuseIdentifier: GistListView.gistCellIdentifier)
    }
    
    public func reloadTableViewData() {
        gistsTableView.reloadData()
    }
}
