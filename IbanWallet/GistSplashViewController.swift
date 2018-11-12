//
//  GistSplashViewController.swift
//  IbanWallet
//
//  Created by Joao Garcia on 11/8/18.
//  Copyright © 2018 SBT. All rights reserved.
//

import UIKit
import Cartography

class GistSplashViewController: UIViewController {

    private lazy var gistSplashView: GistSplashView = {
        let view = GistSplashView(delegate: self)
        view.backgroundColor = Theme.Default.Splash.splashBackgroundColor
        return view
    }()
    
    private var serviceManager: ServiceManager
    
    init(shared: ServiceManager) {
        self.serviceManager = shared
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        playIntroAnimation()
    }
    
    override public func loadView() {
        super.loadView()
        setupView()
        setupLayout()
    }
    
    private func setupView() {
        view.addSubview(gistSplashView)
        view.backgroundColor = .clear
    }
    
    private func setupLayout() {
        constrain(gistSplashView) { view in
            guard let superview = view.superview else {
                return
            }
            view.edges == superview.edges
        }
    }
    
    public func playIntroAnimation() {
        gistSplashView.playSplashAnimation()
    }
    
    public func showList() {
        
        let listViewController = GistListViewController(sharedServiceManager: self.serviceManager)
        let navigationController = UINavigationController(rootViewController: listViewController)
        navigationController.navigationBar.isTranslucent = false;
        
        guard let window = UIApplication.shared.keyWindow else {
            return
        }
        
        guard let rootViewController = window.rootViewController else {
            return
        }
        
        navigationController.view.frame = rootViewController.view.frame
        navigationController.view.layoutIfNeeded()
        
        UIView.transition(with: window, duration: Theme.Default.Splash.splashTransitionAnimationDuration, options: .transitionCrossDissolve, animations: {
            window.rootViewController = navigationController
        })
    }
    
}

extension GistSplashViewController: GistSplashViewDelegate {
    func didFinishSplashScreenAnimation() {
        self.showList()
    }
}

