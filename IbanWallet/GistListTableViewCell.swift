//
//  GistListTableViewCell.swift
//  IbanWallet
//
//  Created by Joao Garcia on 11/8/18.
//  Copyright © 2018 SBT. All rights reserved.
//

import UIKit
import Cartography
import Kingfisher

class GistListTableViewCell: UITableViewCell {
    
    private lazy var gistDescriptionLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.backgroundColor = .clear
        label.textColor = Theme.Default.GistList.gistTableViewCellTextColor
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var gistOwnerUsernameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.backgroundColor = .clear
        label.textColor = Theme.Default.GistList.gistTableViewCellTextColor
        return label
    }()
    
    private lazy var gistOwnerImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = Theme.Default.GistList.iconImageViewSize / 2
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        gistOwnerImageView.image = nil
        gistDescriptionLabel.text = ""
        gistOwnerUsernameLabel.text = ""
    }
    
    public func configure(info: Gist) {
        setupView(info: info)
        setupLayout()
        gistDescriptionLabel.text = info.gistDescription
        gistOwnerUsernameLabel.text = info.owner?.username
        if let imageUrlString = info.owner?.avatarUrlString {
            gistOwnerImageView.kf.setImage(with: URL(string: imageUrlString))
        }
    }
    
    public func setupView(info: Any) {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        contentView.addSubview(gistDescriptionLabel)
        contentView.addSubview(gistOwnerImageView)
        contentView.addSubview(gistOwnerUsernameLabel)
    }
    
    public func setupLayout() {
        
        constrain(gistOwnerImageView) { view in
            guard let superview = view.superview else {
                return
            }
            view.left == superview.left + Theme.Default.GistList.iconImageViewLeftOffset
            view.top == superview.top + Theme.Default.GistList.iconImageViewTopOffset
            view.height == Theme.Default.GistList.iconImageViewSize
            view.width == Theme.Default.GistList.iconImageViewSize
        }
        
        constrain(gistOwnerUsernameLabel, gistOwnerImageView) { label, imageView in
            guard let superview = label.superview else {
                return
            }
            label.left == imageView.right + Theme.Default.GistList.ownerLabelLeftOffset
            label.right == superview.right - Theme.Default.GistList.ownerLabelRightOffset
            label.centerY == imageView.centerY
        }
        
        constrain(gistDescriptionLabel, gistOwnerImageView) { label, imageView in
            guard let superview = label.superview else {
                return
            }
            label.left == superview.left + Theme.Default.GistList.descriptionLabelHorizontalInset
            label.right == superview.right - Theme.Default.GistList.descriptionLabelHorizontalInset
            label.top == imageView.bottom + Theme.Default.GistList.descriptionLabelVerticalInset
            label.bottom == superview.bottom - Theme.Default.GistList.descriptionLabelVerticalInset
        }
    }
}
