//: [Previous](@previous)

import Foundation
import UIKit

var displayLabel: String?

var integerDigits = "3251"
var fractionDigits = "056231"
var hasDecimal = true

func updateDisplay() {
    displayLabel = integerDigits + "." + fractionDigits
}

func backspace() {
    if hasDecimal == true {
        let newString = fractionDigits.substring(to: fractionDigits.index(before: fractionDigits.endIndex))
        fractionDigits = newString
        if fractionDigits == "" {
            hasDecimal = false
        }
    } else {
        let newString = integerDigits.substring(to: integerDigits.index(before: integerDigits.endIndex))
        integerDigits = newString
    }
}

updateDisplay()
backspace()
backspace()
backspace()
backspace()
backspace()
backspace()
backspace()
backspace()