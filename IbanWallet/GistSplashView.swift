//
//  GistSplashView.swift
//  IbanWallet
//
//  Created by Joao Garcia on 11/8/18.
//  Copyright © 2018 SBT. All rights reserved.
//

import UIKit
import Cartography
import Lottie

protocol GistSplashViewDelegate: class {
    func didFinishSplashScreenAnimation()
}

class GistSplashView: UIView {
    
    weak var delegate: GistSplashViewDelegate?
    
    private var splashView: LOTAnimationView = {
        let view = LOTAnimationView(name: "SplashAnimation")
        return view
    }()
    
    init(delegate: GistSplashViewDelegate) {
        super.init(frame: .zero)
        setupView()
        setupLayout()
        self.delegate = delegate
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(splashView)
    }
    
    private func setupLayout() {
        constrain(splashView) { view in
            guard let superview = view.superview else {
                return
            }
            view.centerX == superview.centerX
            view.centerY == superview.centerY - Theme.Default.Splash.animationViewCenterYOffset
            view.width == Theme.Default.Splash.animationViewSize
            view.height == Theme.Default.Splash.animationViewSize
        }
    }
    
    public func playSplashAnimation() {
        splashView.play()
        UIView.animate(withDuration: Theme.Default.Splash.splashAnimationInitialDuration, animations: {
            self.splashView.alpha = 1.0
        }) { (finished) in
            UIView.animate(withDuration: Theme.Default.Splash.splashAnimationFinalDuration, delay: Theme.Default.Splash.splashAnimationDuration, options: .curveEaseIn, animations: {
                self.splashView.alpha = 0.0
            }, completion: { (finished) in
                self.splashView.stop()
                self.delegate?.didFinishSplashScreenAnimation()
            })
        }
    }
}
