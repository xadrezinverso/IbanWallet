//
//  Theme+GistDetail.swift
//  IbanWallet
//
//  Created by Joao Garcia on 11/8/18.
//  Copyright © 2018 SBT. All rights reserved.
//

import UIKit

extension Theme.Default {
    struct GistDetail {
        static let iconImageViewSize: CGFloat = 70.0
        static let iconImageViewTopOffset: CGFloat = 30.0
        static let iconImageViewLeftOffset: CGFloat = 30.0
        
        static let descriptionLabelTopOffset: CGFloat = 20.0
        static let descriptionLabelHorizontalInset: CGFloat = 20.0
        
        static let webViewTopOffset: CGFloat = 20.0
        static let webViewHorizontalInset: CGFloat = 20.0
        static let webViewBottomInset: CGFloat = 20.0
        
        static let loadingViewCenterYOffset: CGFloat = 100.0
        static let loadingViewWidth: CGFloat = 200.0
        static let loadingViewHeight: CGFloat = 150.0
        
        static let detailBackgroundColor: UIColor = .white
        static let descriptionLabelTextColor: UIColor = .black
        static let webViewBackgroundColor: UIColor = UIColor.lightGray.withAlphaComponent(0.2)
        
        static let loadingAnimationDelay: TimeInterval = 2.0
        static let loadingAnimationDuration: TimeInterval = 0.33
    }
}
