//
//  Hater.swift
//  First
//
//  Created by Owen Henley on 04/09/2019.
//  Copyright © 2019 Owen Henley. All rights reserved.
//

import Foundation

struct Hater {
    var hating = false
    
    mutating func hadABadDay() {
        hating = true
    }
    
    mutating func hadAGoodDay() {
        hating = false
    }
}
