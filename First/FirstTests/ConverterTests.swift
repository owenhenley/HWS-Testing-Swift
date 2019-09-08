//
//  ConverterTests.swift
//  FirstTests
//
//  Created by Owen Henley on 08/09/2019.
//  Copyright © 2019 Owen Henley. All rights reserved.
//

import XCTest
@testable import First

class ConverterTests: XCTestCase {
    
    var sut: Converter!

    override func setUp() {
        sut = Converter()
    }

    override func tearDown() {
        sut = nil
    }
    
    func test32FahrenheitIsZeroCelsius() {
        // given
        let input = 32.0
        
        // when
        let celsius = sut.convertToCelsius(fahrenheit: input)
        
        // then
        XCTAssertEqual(celsius, 0, accuracy: 0.000001)
    }
    
    func test212FahrenheitIs100Celsius() {
        // given
        let input = 212.0
        
        // when
        let celsius = sut.convertToCelsius(fahrenheit: input)
        
        // then
        XCTAssertEqual(celsius, 100, accuracy: 0.000001)
    }

}
