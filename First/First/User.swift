//
//  User.swift
//  First
//
//  Created by Owen Henley on 01/11/2019.
//  Copyright © 2019 Owen Henley. All rights reserved.
//

// MARK: - Testing Notifications

import Foundation

struct User {
    
    static let upgradedNotification = Notification.Name("UserUpgraded")
    
    func upgrade(using center: NotificationCenter = NotificationCenter.default) {
        DispatchQueue.global().async {
            Thread.sleep(forTimeInterval: 1)
            center.post(name: User.upgradedNotification, object: nil, userInfo: ["level": "gold"])
        }
    }
}
