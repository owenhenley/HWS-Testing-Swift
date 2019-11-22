//
//  PracticeTests.swift
//  FirstTests
//
//  Created by Owen Henley on 22/11/2019.
//  Copyright © 2019 Owen Henley. All rights reserved.
//

import XCTest
@testable import First

class PracticeTests: XCTestCase {

    class User { }

    class Store {
        var user: User?
        
        func assert(_ condition: @autoclosure () -> Bool, _ message: @autoclosure () -> String = String(), file: StaticString = #file, line: UInt = #line) {
            Swift.assert(condition(), message(), file: file, line: line)
        }
        
        func buy(product: String) -> Bool {
            assert(user != nil, "We can't buy anything without a user.")
            print("The user bought \(product).")
            return true
        }
    }

    func testStoreBuyingWithoutUser() {
        // given
        let store = StoreMock()
        
        // when
        _ = store.buy(product: "War of the Worlds")
        
        // then
        XCTAssertFalse(store.wasAssertionSuccessful)
    }
    
    class StoreMock: Store {
        var wasAssertionSuccessful = false
        
        override func assert(_ condition: @autoclosure () -> Bool, _ message: @autoclosure () -> String = String(), file: StaticString = #file, line: UInt = #line) {
            wasAssertionSuccessful = condition()
        }
    }
}
