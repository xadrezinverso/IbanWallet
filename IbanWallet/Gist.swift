//
//  Gist.swift
//  IbanWallet
//
//  Created by Joao Garcia on 11/8/18.
//  Copyright © 2018 SBT. All rights reserved.
//

import Foundation

class Gist {
    
    let gistDescription: String
    let imageUrlString: String
    
    init(description: String, urlString: String) {
        self.gistDescription = description
        self.imageUrlString = urlString
    }
    
}
