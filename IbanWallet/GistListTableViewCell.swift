//
//  GistListTableViewCell.swift
//  IbanWallet
//
//  Created by Joao Garcia on 11/8/18.
//  Copyright © 2018 SBT. All rights reserved.
//

import UIKit
import Cartography

class GistListTableViewCell: UITableViewCell {
    
    private lazy var gistDescriptionLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.backgroundColor = .clear
        label.textColor = Theme.Default.GistList.gistTableViewCellTextColor
        return label
    }()
    
    public func configure(info: Gist) {
        setupView(info: info)
        setupLayout()
        gistDescriptionLabel.text = info.gistDescription
    }
    
    public func setupView(info: Any) {
        backgroundColor = .clear
        contentView.backgroundColor = Theme.Default.GistList.gistTableViewCellBackgroundColor
        contentView.addSubview(gistDescriptionLabel)
    }
    
    public func setupLayout() {
        constrain(gistDescriptionLabel) { view in
            guard let superview = view.superview else {
                return
            }
            view.edges == superview.edges.inseted(vertically: Theme.Default.GistList.gistTableViewCellVerticalInset)
        }
    }
}
