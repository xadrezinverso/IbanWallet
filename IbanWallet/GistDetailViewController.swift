//
//  GistDetailViewController.swift
//  IbanWallet
//
//  Created by Joao Garcia on 11/8/18.
//  Copyright © 2018 SBT. All rights reserved.
//

import UIKit

class GistDetailViewController: UIViewController {
    
    private lazy var gistListView: GistDetailView = {
        let view = GistDetailView()
        view.backgroundColor = .clear
        return view
    }()
        
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

    }
    
    private func setupLayout() {
        
    }
    
}
