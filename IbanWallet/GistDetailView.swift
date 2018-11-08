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
        imageView.layer.cornerRadius = Theme.Default.GistDetail.iconImageViewHeight / 2
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private var gistTitleDescription: UITextView = {
        let textView = UITextView(frame: .zero)
        return textView
    }()
    
    private var stackView: UIStackView = {
        let view = UIStackView(frame: .zero)
        return view
    }()
    
    private var gistToDisplay: Gist?
    
    init(gist: Gist) {
        self.gistToDisplay = gist
        super.init(frame: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(stackView)
        stackView.addArrangedSubview(iconImageView)
        stackView.addArrangedSubview(gistTitleDescription)
    }
    
    func setupLayout() {
        
    }
}
