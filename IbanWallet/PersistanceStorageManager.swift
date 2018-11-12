//
//  PersistanceStorageManager.swift
//  IbanWallet
//
//  Created by Joao Garcia on 11/8/18.
//  Copyright © 2018 SBT. All rights reserved.
//

import RealmSwift
import ObjectMapper
import Alamofire

class PersistanceStorageManager {
    
    public let database: Realm
    
    init(realm: Realm) {
        database = realm
    }
    
    public func parseAndStoreGists(response: DataResponse<Any>) {
        do {
            guard let items = response.result.value as? [Any] else {
                print("No items available")
                return
            }
            
            try database.write {
                for item in items {
                    
                    guard let gist = Mapper<Gist>().map(JSON: item as! [String : Any]) else {
                        continue
                    }
                    if !gist.gistDescription.isEmpty {
                        database.add(gist, update: true)
                        print("Gist added to realm: \(gist.id)")
                    } else {
                        print("Gist with empty description not added to realm: \(gist.id)")
                    }
                }
            }
        } catch let error as NSError {
            print("Handle \(error)")
            return
        }
    }
    
    public func fetchGistResults() -> Results<Gist> {
        return database.objects(Gist.self)
    }
}
