//
//  ServiceManager.swift
//  IbanWallet
//
//  Created by Joao Garcia on 11/11/18.
//  Copyright © 2018 SBT. All rights reserved.
//

import RealmSwift

class ServiceManager {
    
    static let instance = ServiceManager()
    
    private let networkManager: NetworkManager?
    private let localPersistenceManager: PersistanceStorageManager?
    
    init() {
        do {
            let database = try Realm()
            database.autorefresh = true
            let persistanceStorageManager = PersistanceStorageManager(realm: database)
            let networkMngr = NetworkManager(withUrlAsString: "https://api.github.com/", persistenceManager: persistanceStorageManager)
            networkManager = networkMngr
            localPersistenceManager = persistanceStorageManager
        } catch let error as NSError {
            networkManager = nil
            localPersistenceManager = nil
            print("Error starting Realm database: \(error)")
        }
    }
    
    public func start() {
        networkManager?.downloadGists()
    }
    
    public func listenToGistAdditions() -> Results<Gist>? {
        return localPersistenceManager?.fetchGistResults()
    }
}
