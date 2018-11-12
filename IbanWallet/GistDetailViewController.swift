//
//  GistDetailViewController.swift
//  IbanWallet
//
//  Created by Joao Garcia on 11/8/18.
//  Copyright © 2018 SBT. All rights reserved.
//

import UIKit
import Cartography
import WebKit

class GistDetailViewController: UIViewController {
    
    private lazy var gistDetailView: GistDetailView = {
        let view = GistDetailView(gist: self.gistDetails, webViewDelegate: self)
        view.backgroundColor = Theme.Default.GistDetail.detailBackgroundColor
        return view
    }()
    
    private var gistDetails: Gist
        
    init(gist: Gist) {
        self.gistDetails = gist
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupLayout()
        perform(#selector(loadContent), with: nil, afterDelay: Theme.Default.GistDetail.loadingAnimationDelay)
    }
    
    private func setupView() {
        view.addSubview(gistDetailView)
        view.backgroundColor = .clear
        navigationItem.title = self.gistDetails.owner?.username
    }
    
    private func setupLayout() {
        constrain(gistDetailView) { view in
            guard let superview = view.superview else {
                return
            }
            view.edges == superview.edges
        }
    }
    
    @objc private func loadContent() {
        self.gistDetailView.loadGistContent()
    }
}

extension GistDetailViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        gistDetailView.stopLoadingAnimation()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        gistDetailView.stopLoadingAnimation()
    }
}
