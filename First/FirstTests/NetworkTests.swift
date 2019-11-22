//
//  NetworkTests.swift
//  FirstTests
//
//  Created by Owen Henley on 22/11/2019.
//  Copyright © 2019 Owen Henley. All rights reserved.
//

import XCTest
@testable import First

class NetworkTests: XCTestCase {
    
    func testNewsFetchLoadsCorrectURL() {
        // given
        let url = URL(string: "https://www.apple.com/newsroom/rss-feed.rss")!
        let news = News(url: url)
        let session = URLSessionMock()
        let expectation = XCTestExpectation(description: "Downloading news stories.")
        
        // when
        news.fetch(using: session) {
            XCTAssertEqual(URL(string: "https://www.apple.com/newsroom/rss-feed.rss"), session.lastURL)
            expectation.fulfill()
        }
        
        // then
        wait(for: [expectation], timeout: 5)
    }
    
}
