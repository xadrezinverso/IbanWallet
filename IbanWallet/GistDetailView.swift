//
//  GistDetailView.swift
//  IbanWallet
//
//  Created by Joao Garcia on 11/8/18.
//  Copyright © 2018 SBT. All rights reserved.
//

import UIKit
import Kingfisher
import Cartography
import WebKit
import Lottie

class GistDetailView: UIView {
    
    private var iconImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = Theme.Default.GistDetail.iconImageViewSize / 2
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private var gistTitleDescriptionLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.textColor = Theme.Default.GistDetail.descriptionLabelTextColor
        label.numberOfLines = 0
        return label
    }()
    
    private var loadingView: LOTAnimationView = {
        let view = LOTAnimationView(name: "LoadingAnimation")
        view.play()
        view.loopAnimation = true
        return view
    }()
    
    private var webView: WKWebView = {
        let view = WKWebView(frame: .zero)
        view.alpha = 0.0
        view.scrollView.backgroundColor = Theme.Default.GistDetail.webViewBackgroundColor
        return view
    }()
    
    private var gistToDisplay: Gist?
    
    init(gist: Gist, webViewDelegate: WKNavigationDelegate) {
        self.gistToDisplay = gist
        super.init(frame: .zero)
        setupView()
        setupLayout()
        webView.navigationDelegate = webViewDelegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        
        addSubview(iconImageView)
        addSubview(gistTitleDescriptionLabel)
        addSubview(webView)
        addSubview(loadingView)
        
        gistTitleDescriptionLabel.text = self.gistToDisplay?.gistDescription
        if let imageUrlString = self.gistToDisplay?.owner?.avatarUrlString {
            iconImageView.kf.setImage(with: URL(string: imageUrlString))
        }
    }
    
    func setupLayout() {
        
        constrain(iconImageView) { view in
            guard let superview = view.superview else {
                return
            }
            view.left == superview.left + Theme.Default.GistDetail.iconImageViewLeftOffset
            view.top == superview.top + Theme.Default.GistDetail.iconImageViewTopOffset
            view.height == Theme.Default.GistDetail.iconImageViewSize
            view.width == Theme.Default.GistDetail.iconImageViewSize
        }
        
        constrain(gistTitleDescriptionLabel, iconImageView) { label, imageView  in
            guard let superview = label.superview else {
                return
            }
            label.left == superview.left + Theme.Default.GistDetail.descriptionLabelHorizontalInset
            label.right == superview.right - Theme.Default.GistDetail.descriptionLabelHorizontalInset
            label.top == imageView.bottom + Theme.Default.GistDetail.descriptionLabelTopOffset
        }
        
        constrain(webView, gistTitleDescriptionLabel) { webView, label  in
            guard let superview = webView.superview else {
                return
            }
            webView.left == superview.left + Theme.Default.GistDetail.webViewHorizontalInset
            webView.right == superview.right - Theme.Default.GistDetail.webViewHorizontalInset
            webView.top == label.bottom + Theme.Default.GistDetail.webViewTopOffset
            webView.bottom == superview.bottom + Theme.Default.GistDetail.webViewBottomInset
        }
        
        constrain(loadingView, webView) { view, webView  in
            view.width == Theme.Default.GistDetail.loadingViewWidth
            view.height == Theme.Default.GistDetail.loadingViewHeight
            view.centerX == webView.centerX
            view.centerY == webView.top + Theme.Default.GistDetail.loadingViewCenterYOffset
            
        }
    }
    
    public func loadGistContent() {
        if let contentUrlString = self.gistToDisplay?.htmlUrlString {
            if let url = URL(string: contentUrlString) {
                webView.load(URLRequest(url: url))
            }
        }
    }
    
    public func stopLoadingAnimation() {
        loadingView.stop()
        UIView.animate(withDuration: Theme.Default.GistDetail.loadingAnimationDuration, animations: {
            self.webView.alpha = 1.0
            self.loadingView.alpha = 0.0
        }) { (finished) in
            self.loadingView.isHidden = true
        }
    }
}
