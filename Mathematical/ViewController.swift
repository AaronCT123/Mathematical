//
//  ViewController.swift
//  Mathematical
//
//  Created by Aaron C-T on 6/15/17.
//  Copyright © 2017 Aaron C-T. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    var integerDigits: String = "0"
    var fractionDigits: String = ""
    var displayValue: NSNumber = 0

    var hasAnswer = false
    var isDecimal = false
    var isTyping = false
    var isNegative = false
    
    var firstNumber: Double = 0
    var secondNumber: Double = 0
    
    var operation: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func numberKeyTapped(sender: UIButton) {
        let keyTapped = sender.currentTitle
        let textEntry = integerDigits + fractionDigits
        let charCount = textEntry.characters.count
        
        if (charCount < 10) || (charCount < 11 && isDecimal == true) {
            if let key = keyTapped {
                if isTyping {
                    if isDecimal == true {
                        fractionDigits += key
                    } else {
                        integerDigits += key
                    }
                } else {
                    integerDigits = key
                    isTyping = true
                }
            }
        }
        
        hasAnswer = false
        updateDisplay()
    }

    @IBAction func decimalKeyTapped(sender: Key) {
        let textEntry = integerDigits + fractionDigits
        let charCount = textEntry.characters.count
        
        if isDecimal == false && charCount < 10 {
            isTyping = true
            isDecimal = true
            hasAnswer = false
            
            fractionDigits = "."
            updateDisplay()
        }
    }
 
    @IBAction func negativeKeyTapped(sender: Key) {
        let sign = !isNegative
        isNegative = sign
        updateDisplay()
    }
    
    @IBAction func deleteKeyTapped(sender: Key) {
        if hasAnswer == false {
            if isDecimal == true {
                let newString = fractionDigits.substring(to: fractionDigits.index(before: fractionDigits.endIndex))
                fractionDigits = newString
            
                if fractionDigits == "" {
                    isDecimal = false
                }
            
            } else {
                let newString = integerDigits.substring(to: integerDigits.index(before: integerDigits.endIndex))
                integerDigits = newString
            
                if integerDigits == "" {
                    clearScreen()
                }
            }
            
            updateDisplay()
        }
    }
    
    @IBAction func clearKeyTapped(sender: Key) {
        clearScreen()
    }
 
    @IBAction func operationKeyTapped(sender: Key) {
        operation = sender.currentTitle
        firstNumber = Double(displayValue)
        
        isTyping = false
        isDecimal = false
        isNegative = false
        fractionDigits = ""
    }
    
    @IBAction func equalsKeyTapped(sender: Key) {
        calculate()
    }
    
    // Can I make an optional version of this that updates the display with the number passed in?
    // Or should I keep it as is so that displayLabel only updates once it has a value to display?
    
    // Currently doesn’t work if user presses Equals Key after entering firstNumber. Might have to make firstNumber & secondNumber optionals?
    func calculate() {
        var solution: Double = 0
        let display = Double(displayValue)
        secondNumber = Double(displayValue)
        
        if let op = operation {
            if isTyping {
                if op == "+" {
                    solution = firstNumber + secondNumber
                }
                if op == "−" {
                    solution = firstNumber - secondNumber
                }
                if op == "×" {
                    solution = firstNumber * secondNumber
                }
                if op == "÷" {
                    solution = firstNumber / secondNumber
                }
                
                firstNumber = secondNumber
            } else {
                if op == "+" {
                    solution += display + firstNumber
                }
                if op == "−" {
                    solution = display - firstNumber
                }
                if op == "×" {
                    solution = display * firstNumber
                }
                if op == "÷" {
                    solution = display / firstNumber
                }
            }
        } else {
            solution = display
        }
        
        let solutionString = String(solution)
        let charCount = solutionString.characters.count
        
        displayValue = getNumber(from: solutionString)
        
        if (charCount > 10) || (charCount > 11 && isDecimal == true) {
            displayLabel.text = scientificNotation(of: displayValue)
        } else {
            displayLabel.text = getString(from: displayValue)
        }
        
        isTyping = false
        hasAnswer = true
    }
    
    func updateDisplay() {
        var integerValue: NSNumber?
        
        if isNegative {
            integerValue = getNumber(from: "-\(integerDigits)")
        } else {
            integerValue = getNumber(from: integerDigits)
        }
        
        if let cleanString = integerValue {
            if isDecimal == true {
                let intString = getString(from: cleanString)
            
                if let ints = intString {
                    displayLabel.text = ints + fractionDigits
                }
            } else {
                displayLabel.text = getString(from: cleanString)
            }
        
        displayValue = getNumber(from: displayLabel.text)
        }
    }

    func clearScreen() {
        integerDigits = "0"
        fractionDigits = ""
        displayValue = 0
        firstNumber = 0
        secondNumber = 0
        
        hasAnswer = false
        isDecimal = false
        isTyping = false
        isNegative = false
        updateDisplay()
    }
    
}
