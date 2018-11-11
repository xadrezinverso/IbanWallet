//
//  Gist.swift
//  IbanWallet
//
//  Created by Joao Garcia on 11/8/18.
//  Copyright © 2018 SBT. All rights reserved.
//

import RealmSwift
import ObjectMapper

class Gist: Object, Mappable {
    
    @objc dynamic var id: String = ""
    @objc dynamic var owner: GistOwner?
    @objc dynamic var gistDescription: String = ""
    @objc dynamic var gistUrlString: String = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        gistUrlString <- map["url"]
        gistDescription <- map["description"]
        owner <- map["owner"]
    }
}
