//
//  UserTests.swift
//  FirstTests
//
//  Created by Owen Henley on 01/11/2019.
//  Copyright © 2019 Owen Henley. All rights reserved.
//

import XCTest
@testable import First

class UserTests: XCTestCase {
    
    func testUserUpgradedPostsNotification() {
        // given
        let center = NotificationCenter()
        let user = User()
        let expectation = XCTNSNotificationExpectation(name: User.upgradedNotification, object: nil, notificationCenter: center)
        
        expectation.handler = { notification -> Bool in
            guard let level = notification.userInfo?["level"] as? String else {
                return false
            }
            
            if level == "gold" {
                return true
            } else {
                return false
            }
        }
        
        // when
        user.upgrade(using: center)
        
        // then
        wait(for: [expectation], timeout: 3)
    }
    
}
