//
//  PrimeCalculatorTests.swift
//  FirstTests
//
//  Created by Owen Henley on 01/11/2019.
//  Copyright © 2019 Owen Henley. All rights reserved.
//

import XCTest
@testable import First

class PrimeCalculatorTests: XCTestCase {
    
    func testPrimePerformance() {
        measure {
            _ = PrimeCalculator.calculate(upTo: 1_000_000) }
    }

}
