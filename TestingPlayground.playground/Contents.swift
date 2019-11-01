import Foundation
import XCTest

//func divisionRemainder(of number: Int, dividedBy: Int) -> (quotient: Int, remainder: Int) {
//    let quotient = number / dividedBy
//    let remainder = number % dividedBy
//    return (quotient, remainder)
//}
//
//func verifyDivision(_ result: (quotient: Int, remainder: Int), expectedQuotient: Int, expectedRemainder: Int, file: StaticString = #file, line: UInt = #line) {
//    XCTAssertEqual(result.quotient, expectedQuotient, file: file, line: line)
//    XCTAssertEqual(result.remainder, expectedRemainder, file: file, line: line)
//}
//
//func testDivisors() {
//    // given
//    let dividend = 10
//    let divisor = 3
//
//    // when
//    let result = divisionRemainder(of: dividend, dividedBy: divisor)
//
//    // then
//    verifyDivision(result, expectedQuotient: 3, expectedRemainder: 2)
//}

class Tests: XCTestCase {
    func testThreeIngredientCakeCosts9() {
        // given
        let cake = Cake()
        let ingredients = ["chocolate", "cherries", "frosting"]
        // when
        let cost = cake.bake(ingredients: ingredients)
        // then
        XCTAssertEqual(cost, 10)
    }
}


struct Cake {
    func bake(ingredients: [String]) -> Int {
        
        for ingredient in ingredients {
            print("Adding \(ingredient).")
        }
        
        let cost = 1 + (ingredients.count * 3)
        print("The cake is ready; please pay \(cost).")
        return 10 // mutation, test will pass, but doesnt mee the code is working
    }
}

// MARK: - Dependency Injection

struct App {
    
    var price: Decimal
    var minimumAge: Int
    var isReleased: Bool
    
    func canBePurchased(by user: User) -> Bool {
        
        guard isReleased else {
            return false
        }
        
        guard user.funds >= price else {
            return false
        }
        
        if user.age >= minimumAge {
            return true
        } else {
            return false
        }
    }
}

struct User {
    
    var funds: Decimal
    var age: Int
    var apps: [App]
    
    mutating func buy(_ app: App) -> Bool {
        let possible = app.canBePurchased(by: self)
        
        if possible {
            apps.append(app)
            funds -= app.price
            return true
        } else {
            return false
        }
    }
}
