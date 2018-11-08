//
//  GistListViewController.swift
//  IbanWallet
//
//  Created by Joao Garcia on 11/8/18.
//  Copyright © 2018 SBT. All rights reserved.
//

import UIKit

class GistListViewController: UIViewController {
    
    private lazy var gistListView: GistListView = {
        let view = GistListView(tableViewDelegate: self, tableViewDataSource: self)
        view.backgroundColor = .clear
        return view
    }()
    
    public var tableViewRows: [Gist]?
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupLayout()
    }
    
    private func setupView() {
        view.addSubview(gistListView)
//        view.backgroundColor = Theme.Default.More.About.backgroundColor
//        title = Strings.More.About.navBarTitle
        setupTableViewCellsInfo()
    }
    
    private func setupLayout() {
        
    }
    
    private func setupTableViewCellsInfo() {
        
        let gist = Gist(description: "HELLOO", urlString: "www.google.pt")
        
        tableViewRows = [gist, gist, gist]
    }
}

extension GistListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewRows?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return GistListTableViewCell()
    }
}

extension GistListViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectedGist = tableViewRows?[indexPath.row] else {
            return
        }
        
        let detailController = GistDetailViewController(gist: selectedGist)
        self.navigationController?.pushViewController(detailController, animated: true)
    }
}
