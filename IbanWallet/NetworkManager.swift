//
//  NetworkManager.swift
//  IbanWallet
//
//  Created by Joao Garcia on 11/8/18.
//  Copyright © 2018 SBT. All rights reserved.
//

import Foundation

enum NetworkManagerResponseResult {
    case success
    case failed
}

struct NetworkManagerResponse {
    let result: NetworkManagerResponseResult
    let value: [Gist]?
}

class NetworkManager {
    
    private let urlAsString: String
    private let localPersistenceManager: PersistanceStorageManager
    
    init(withUrlAsString url: String, persistenceManager: PersistanceStorageManager) {
        urlAsString = url
        localPersistenceManager = persistenceManager
    }
    
    //    func getGists() -> NetworkManagerResponse {
    //        return
    //    }
    
    //    func favouriteGist() -> NetworkManagerResponse {
    //        return
    //    }
    
    //    func getGist() -> NetworkManagerResponse {
    //        return
    //    }

}
