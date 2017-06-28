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
    
    var textEntry = "0"
    var displayValue: NSNumber = 0
    
    var isTyping = false

    var firstNumber: Double = 0
    var secondNumber: Double = 0
    
    var operation: String?
    
    /*
    var solution: Double = 0
    */
    
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
            if let key = keyTapped {
                textEntry += key
            }
        } else {
            if let key = keyTapped {
                textEntry = key
                isTyping = true
            }
        }
        
        displayValue = getNumber(from: textEntry)
        displayLabel.text = getString(from: displayValue)
    }
    
    @IBAction func zeroKeyTapped(sender: Key) {
        
    }
    
    @IBAction func decimalKeyTapped(sender: Key) {
        if textEntry.hasDecimal == false {
            textEntry += "."
            isTyping = true
            
            displayValue = getNumber(from: textEntry)
            displayLabel.text = "\(getString(from: displayValue) ?? "")" + "."
        }
    }
    
    @IBAction func deleteKeyTapped(sender: Key) {
        /*
        if textEntry != "" && textEntry != nil {
            textEntry.remove(at: textEntry.index(before: textEntry.endIndex))
            
            if textEntry.lastCharacter != "." {
                displayValue = getNumber(from: textEntry)
                displayLabel.text = getString(from: displayValue)
            } else {
                displayValue = getNumber(from: textEntry)
                displayLabel.text = "\(getString(from: displayValue) ?? "")" + "."
                textEntry = displayLabel.text!
            }
        } else {
            clearDisplay()
        }
        */
    }
    
    @IBAction func clearKeyTapped(sender: Key) {
        clearDisplay()
    }
    
    @IBAction func operationKeyTapped(sender: Key) {
        
        /*
        valueOne = displayLabel.text
        operation = sender.currentTitle
        // ^^ Replace with check for UIButton Tag? Or Use custom classes?
 
        
        isTyping = false
        */
        
        enum Operation: String {
            case add = "+"
            case subtract = "−"
            case divide = "÷"
            case multiply = "×"
        }
        
        operation = sender.currentTitle
        firstNumber = Double(displayValue)
        isTyping = false
    }
    
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
    
    func clearDisplay() {
        firstNumber = 0
        secondNumber = 0
        displayLabel.text = "0"
        isTyping = false
    }
    
}

