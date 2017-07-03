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
    var hasDecimal = false
    var isTyping = false
    
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
        
        if (charCount < 10) || (charCount < 11 && hasDecimal == true) {
            if let key = keyTapped {
                if isTyping {
                    if hasDecimal == true {
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
        
        if hasDecimal == false && charCount < 10 {
            isTyping = true
            hasDecimal = true
            hasAnswer = false
            
            fractionDigits = "."
            updateDisplay()
        }
    }
 
    @IBAction func percentKey(sender: Key) {
        let currentValue = Double(displayValue)
        print(currentValue)
        print("currentValue")
        let percentage = currentValue/100
        print(percentage)
        print("percentage")
        let percentString = String(percentage)
        print(percentString)
        
        displayValue = getNumber(from: percentString)
        displayLabel.text = getString(from: displayValue)
        isTyping = false
    }
    
    @IBAction func deleteKeyTapped(sender: Key) {
        if hasAnswer == false {
            if hasDecimal == true {
                let newString = fractionDigits.substring(to: fractionDigits.index(before: fractionDigits.endIndex))
                fractionDigits = newString
            
                if fractionDigits == "" {
                    hasDecimal = false
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
        hasDecimal = false
        fractionDigits = ""
    }
    
    @IBAction func equalsKeyTapped(sender: Key) {
        calculate()
    }
    
    func calculate() {
        var solution: Double = 0
        let display = Double(displayValue)
        secondNumber = Double(displayValue)
        
        if isTyping {
            if operation == "+" {
                solution = firstNumber + secondNumber
            }
            if operation == "−" {
                solution = firstNumber - secondNumber
            }
            if operation == "×" {
                solution = firstNumber * secondNumber
            }
            if operation == "÷" {
                solution = firstNumber / secondNumber
            }
            
            firstNumber = secondNumber
        } else {
            if operation == "+" {
                solution += display + firstNumber
            }
            if operation == "−" {
                solution = display - firstNumber
            }
            if operation == "×" {
                solution = display * firstNumber
            }
            if operation == "÷" {
                solution = display / firstNumber
            }
        }

        let solutionString = String(solution)
        let charCount = solutionString.characters.count
        
        displayValue = getNumber(from: solutionString)
        
        if (charCount > 10) || (charCount > 11 && hasDecimal == true) {
            displayLabel.text = scientificNotation(of: displayValue)
        } else {
            displayLabel.text = getString(from: displayValue)
        }
        
        isTyping = false
        hasAnswer = true
    }
    
    func updateDisplay() {
        let cleanIntString = getNumber(from: integerDigits)
        
        if hasDecimal == true {
            let intString = getString(from: cleanIntString)
            
            if let ints = intString {
                displayLabel.text = ints + fractionDigits
            }
        } else {
            displayLabel.text = getString(from: cleanIntString)
        }
        
        displayValue = getNumber(from: displayLabel.text)
    }

    func clearScreen() {
        integerDigits = "0"
        fractionDigits = ""
        displayValue = 0
        firstNumber = 0
        secondNumber = 0
        
        hasAnswer = false
        hasDecimal = false
        isTyping = false
        updateDisplay()
    }
    
}
