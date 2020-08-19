//
//  Message.swift
//  ShhhMobile
//
//  Created by Dayu Jiang on 5/17/20.
//  Copyright © 2020 Dayu Jiang. All rights reserved.
//

import Firebase

import Firebase

struct Message {
    let text: String
    let toId: String
    let fromId: String
    var timestamp: Date?
    var user: User?
    
    let isFromCurrentUser: Bool
    
    var chatPartnerId: String {
        return isFromCurrentUser ? toId : fromId
    }
    
    init(dictionary: [String: Any]) {
        self.text = dictionary["messageText"] as? String ?? ""
        self.toId = dictionary["toID"] as? String ?? ""
        self.fromId = dictionary["fromID"] as? String ?? ""
        self.isFromCurrentUser = fromId == Auth.auth().currentUser?.uid
        
        if let timestamp = dictionary[KEY_TIMESTAMP] as? Double {
            self.timestamp = Date(timeIntervalSince1970: timestamp)
        }
        
    }
}

struct Conversation {
    let user: User
    let message: Message
}

