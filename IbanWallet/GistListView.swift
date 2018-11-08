//
//  GistListView.swift
//  IbanWallet
//
//  Created by Joao Garcia on 11/8/18.
//  Copyright © 2018 SBT. All rights reserved.
//

import UIKit

class GistListView: UIView {
    
    public let gistCellIdentifier = "gistCell"
    
    private lazy var tableView: UITableView = {
        let gistTableView = UITableView(frame: .zero, style: .plain)
        gistTableView.backgroundColor = .clear
        return gistTableView
    }()
    
    init(tableViewDelegate: UITableViewDelegate, tableViewDataSource: UITableViewDataSource) {
        super.init(frame: .zero)
        tableView.delegate = tableViewDelegate
        tableView.dataSource = tableViewDataSource
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(tableView)
        registerTableViewCells()
    }
    
    func setupLayout() {
        
    }
    
    private func registerTableViewCells() {
        tableView.register(GistListTableViewCell.self, forCellReuseIdentifier: gistCellIdentifier)
    }
}
