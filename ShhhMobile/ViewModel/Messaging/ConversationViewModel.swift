//
//  ConversationViewModel.swift
//  ShhhMobile
//
//  Created by Dayu Jiang on 5/17/20.
//  Copyright © 2020 Dayu Jiang. All rights reserved.
//

import Foundation

struct ConversationViewModel {
    private let conversation: Conversation
    
    var timestamp: String? {
        guard let date = conversation.message.timestamp else { return nil }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "hh:mm a"
        return dateFormatter.string(from: date)
    }
    
    init(conversation: Conversation) {
        self.conversation = conversation
    }
}
