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

class FunctionKey: Key {
    /*
    let operation = String
    
    switch operation {
        case .add:
    }
    */
}

enum Operation: String {
    case add = "+"
    case subtract = "−"
    case divide = "÷"
    case multiply = "×"
}

/*
func getNumber(from string: String?) -> NSNumber {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    return formatter.number(from: string!)!
}
*/

func getNumber(from string: String?) -> NSNumber {
    var number: NSNumber = 0
    
    if let str = string {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        number = formatter.number(from: str)!
    }
    
    return number
}

func getString(from value: NSNumber) -> String? {
    
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    
    let formattedNumber = formatter.string(from: value)
    return formattedNumber
}

func cleanString(_ value: NSNumber) -> String? {
    let formatter = NumberFormatter()
    let formattedNumber = formatter.string(from: value)
}
