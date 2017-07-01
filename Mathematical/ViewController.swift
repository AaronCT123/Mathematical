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
    
    var textEntry: String? = "0"
    var displayValue: NSNumber = 0.000

    var isTyping = false
    var trailingZeroes = ""
    
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
        
        if isTyping {
            if let key = keyTapped, let text = textEntry {
                let characterCount = text.characters.count
                if (text.hasDecimal && characterCount < 11) || (characterCount < 10) {
                    textEntry = text + key
                }
            }
        } else {
            if let key = keyTapped {
                textEntry = key
                isTyping = true
            }
        }
        
        trailingZeroes = ""
        displayValue = getNumber(from: textEntry)
        updateDisplay()
    }
    
    @IBAction func zeroKeyTapped(sender: Key) {
        let key = "0"
        trailingZeroes += "0"

        if isTyping {
            if let text = textEntry {
                textEntry = text + key
                
                if text.hasDecimal && (text.lastCharacter == "." || text.lastCharacter == "0") {
                    displayLabel.text = "\(getString(from: displayValue) ?? "")" + "." + trailingZeroes
                } else {
                    displayLabel.text = "\(getString(from: displayValue) ?? "")" + key
                }
            }
        }
    }

    @IBAction func decimalKeyTapped(sender: Key) {
        var newString: String?
 
        if let oldString = textEntry {
            if oldString.hasDecimal == false {
                newString = oldString + "."
                isTyping = true
                trailingZeroes = ""
                
                textEntry = newString
                displayValue = getNumber(from: newString)
                displayLabel.text = "\(getString(from: displayValue) ?? "")" + "."
            }
        }
    }
 
    @IBAction func deleteKeyTapped(sender: Key) {
        var newString: String?
        
        if let oldString = textEntry {
            newString = oldString.substring(to: oldString.index(before: oldString.endIndex))
        }
        
        print(newString)
        print("^^ newString")
        
        if let new = newString {
            
        if new == "" || new == nil {
            clearScreen()
        } else if new.lastCharacter == "." {
            textEntry = new
            displayValue = getNumber(from: new)
            displayLabel.text = "\(getString(from: displayValue) ?? "")" + "."
        } else if new.hasDecimal && new.lastCharacter == "0" {
            textEntry = new
            displayValue = getNumber(from: new)
            displayLabel.text = "\(getString(from: displayValue) ?? "")" + trailingZeroes
        } else {
            textEntry = new
            displayValue = getNumber(from: textEntry)
            
        }
            print(textEntry)
            print("^^ textEntry")
            updateDisplay()
        }
    
    }
    
    @IBAction func clearKeyTapped(sender: Key) {
        clearScreen()
    }
 
    /*
    @IBAction func operationKeyTapped(sender: Key) {
        operation = sender.currentTitle
        firstNumber = Double(displayValue)
        isTyping = false
    }
    */
    
    /*
    @IBAction func equalsKeyTapped(sender: Key) {
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
        
        isTyping = false
        textEntry = "\(solution)"
        displayValue = getNumber(from: textEntry)
        displayLabel.text = getString(from: displayValue)
    }
    */
    
    // Can I make an optional version of this that updates the display with the number passed in?
    // Or should I keep it as is so that displayLabel only updates once it has a value to display?
    
    func updateDisplay() {
        displayLabel.text = getString(from: displayValue)
    }

    func clearScreen() {
        trailingZeroes = ""
        textEntry = "0"
        displayValue = 0
        firstNumber = 0
        secondNumber = 0
        isTyping = false
        updateDisplay()
    }
    
}

