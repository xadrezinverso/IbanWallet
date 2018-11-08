//
//  GistDetailView.swift
//  IbanWallet
//
//  Created by Joao Garcia on 11/8/18.
//  Copyright © 2018 SBT. All rights reserved.
//

import UIKit

class GistDetailView: UIView {
    
    private var iconImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.layer.cornerRadius = 27
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private var gistTitleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        return label
    }()
    
    private var gistTitleDescription: UITextView = {
        let textView = UITextView(frame: .zero)
        return textView
    }()
    
    private var stackView: UIStackView = {
        let view = UIStackView(frame: .zero)
        return view
    }()
    
    func setupView() {
        addSubview(stackView)
        stackView.addArrangedSubview(iconImageView)
        stackView.addArrangedSubview(gistTitleLabel)
        stackView.addArrangedSubview(gistTitleDescription)
    }
    
    func setupLayout() {
        
    }
}
