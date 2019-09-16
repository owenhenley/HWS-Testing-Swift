//
//  ThrowingTests.swift
//  FirstTests
//
//  Created by Owen Henley on 16/09/2019.
//  Copyright © 2019 Owen Henley. All rights reserved.
//

import XCTest

// MARK: - Tests

class ThrowingTests: XCTestCase {
    
    func testPlayingBioBlitzThrows() {
        let game = Game(name: "BioBlitz")
        
        do {
            try game.play()
            XCTFail()
        } catch GameError.notPurchased {
            // Success!
        } catch {
            XCTFail()
        }
    }
    
    func testPlayingBlastazapThrows() {
        let game = Game(name: "Blastazap")
        
        XCTAssertThrowsError(try game.play()) { error in
            XCTAssertEqual(error as? GameError, GameError.notInstalled)
        }
    }
    
    func testPlayingExplodingMonkeysDoesntThrow() {
        let game = Game(name: "Exploding Monkeys")
        XCTAssertNoThrow(try game.play())
    }
    
    func testDeadStormRisingThrows() throws {
        let game = Game(name: "Dead Storm Rising")
        
        do {
            try game.play()
            XCTFail()
        } catch GameError.parentalControlsDisallowed {
            // Success!
        } catch {
            XCTFail()
        }
    }
    
    func testCrashyPlaneDoesntThrow() throws {
        let game = Game(name: "CrashyPlane")
        try game.play()
    }
    
}

// MARK: - Code

enum GameError: LocalizedError {
    case notPurchased
    case notInstalled
    case parentalControlsDisallowed
}

struct Game {
    
    let name: String
    
    func play() throws {
        if name == "BioBlitz" {
            throw GameError.notPurchased
        } else if name == "Blastazap" {
            throw GameError.notInstalled
        } else if name == "Dead Storm Rising" {
            throw GameError.parentalControlsDisallowed
        } else {
            print("\(name) is OK to play!")
        }
    }
}

// MARK: - LocalizezedError+Extension

extension LocalizedError {
    var errorDescription: String? {
        return "\(self)"
    }
}
