import XCTest

func divisionRemainder(of number: Int, dividedBy: Int) -> (quotient: Int, remainder: Int) {
    let quotient = number / dividedBy
    let remainder = number % dividedBy
    return (quotient, remainder)
}

func verifyDivision(_ result: (quotient: Int, remainder: Int), expectedQuotient: Int, expectedRemainder: Int, file: StaticString = #file, line: UInt = #line) {
    XCTAssertEqual(result.quotient, expectedQuotient, file: file, line: line)
    XCTAssertEqual(result.remainder, expectedRemainder, file: file, line: line)
}

func testDivisors() {
    // given
    let dividend = 10
    let divisor = 3
    
    // when
    let result = divisionRemainder(of: dividend, dividedBy: divisor)
    
    // then
    verifyDivision(result, expectedQuotient: 3, expectedRemainder: 2)
}

// MARK: - Advanced Expectations

func testIsInverted() {
    // given
    let ai = AI()
    let expectation = XCTestExpectation(description: "Computer must wait at least two seconds before taking its turn")
    expectation.isInverted = true

    // when
    ai.startMove() {
      // then
      // pause competed; mark that we finished our turn
      expectation.fulfill()
    }

    wait(for: [expectation], timeout: 1.8)
}
