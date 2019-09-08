//
//  Converter.swift
//  First
//
//  Created by Owen Henley on 08/09/2019.
//  Copyright © 2019 Owen Henley. All rights reserved.
//

import Foundation

struct Converter {
    
    func convertToCelsius(fahrenheit: Double) -> Double {
        let fahrenheit = Measurement(value: fahrenheit, unit: UnitTemperature.fahrenheit)
        let celsius = fahrenheit.converted(to: .celsius)
        return celsius.value
    }
    
}
