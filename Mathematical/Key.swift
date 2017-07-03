//
//  Key.swift
//  Mathematical
//
//  Created by Aaron C-T on 6/24/17.
//  Copyright © 2017 Aaron C-T. All rights reserved.
//

import Foundation
import UIKit

class Key: UIButton {
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        self.layer.cornerRadius = 3
    }
}

extension String {
    var hasDecimal: Bool {
        if self.characters.contains(".") {
            return true
        } else {
            return false
        }
    }
    
    var lastCharacter: Character {
        return self.characters.last!
    }
}

let stringFormatter = NumberFormatter()

func getString(from value: NSNumber) -> String? {
    stringFormatter.numberStyle = .decimal
    stringFormatter.usesSignificantDigits = true
    stringFormatter.maximumSignificantDigits = 10
    return stringFormatter.string(from: value)
}

func scientificNotation(of value: NSNumber) -> String? {
    stringFormatter.numberStyle = .scientific
    stringFormatter.usesSignificantDigits = true
    stringFormatter.maximumSignificantDigits = 6
    
    let solution = stringFormatter.string(from: value)
    return solution?.lowercased()
}

let numberFormatter = NumberFormatter()

func getNumber(from string: String?) -> NSNumber {
    numberFormatter.numberStyle = .decimal
    return numberFormatter.number(from: string!)!
}






























