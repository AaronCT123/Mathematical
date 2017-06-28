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

func getNumber(from string: String?) -> NSNumber {
  
    let formatter = NumberFormatter()
    formatter.generatesDecimalNumbers = true
    formatter.numberStyle = .decimal
    return formatter.number(from: string!)!
    
}

func getString(from value: NSNumber) -> String? {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    return formatter.string(from: value)
}
