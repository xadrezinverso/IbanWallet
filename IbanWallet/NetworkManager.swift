//
//  NetworkManager.swift
//  IbanWallet
//
//  Created by Joao Garcia on 11/8/18.
//  Copyright © 2018 SBT. All rights reserved.
//

import Alamofire

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
    
    func downloadGists() {
        let url: String = urlAsString + "gists/public"
        Alamofire.request(url, method: .get).responseJSON { (response: DataResponse) in
            switch response.result {
            case .success:
                self.localPersistenceManager.parseAndStoreGists(response: response)
            case .failure(let error):
                print("Handle \(error)")
            }
        }
    }
    
    //    func favouriteGist() -> NetworkManagerResponse {
    //        return
    //    }
    
    //    func getGist() -> NetworkManagerResponse {
    //        return
    //    }

}
