//
//  GistOwner.swift
//  IbanWallet
//
//  Created by Joao Garcia on 11/11/18.
//  Copyright © 2018 SBT. All rights reserved.
//

import RealmSwift
import ObjectMapper

class GistOwner: Object, Mappable {
    
    @objc dynamic var username: String = ""
    @objc dynamic var avatarUrlString: String = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        username <- map["login"]
        avatarUrlString <- map["avatar_url"]
    }
}
