//
//  GistListTableViewCell.swift
//  IbanWallet
//
//  Created by Joao Garcia on 11/8/18.
//  Copyright © 2018 SBT. All rights reserved.
//

import UIKit

class GistListTableViewCell: UITableViewCell {
    
    public func configure(info: Any) {
        setupView(info: info)
        setupLayout()
    }
    
    public func setupView(info: Any) {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
    }
    
    public func setupLayout() {
        
    }
}
