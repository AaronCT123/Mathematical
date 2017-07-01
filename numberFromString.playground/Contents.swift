
//: Playground - noun: a place where people can play

import UIKit

// 1,234,567,891

var number: NSNumber = 1234567891

var decimal: NSNumber = 235.00

var numberLabel = ""
var decimalLabel = ""

func getString(from number: NSNumber) -> String {
    let stringFormatter = NumberFormatter()
    stringFormatter.generatesDecimalNumbers = true
    stringFormatter.usesSignificantDigits = true
    stringFormatter.numberStyle = .decimal
    return stringFormatter.string(from: number)!
}

numberLabel = getString(from: number)
decimalLabel = getString(from: decimal)
