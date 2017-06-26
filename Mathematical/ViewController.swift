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
    
    var labelText = "0"
    var displayValue: NSNumber = 0
    
    var isTyping = false
    var hasDecimal = false

    /*
    var valueOne: String?
    var valueTwo: String?
    var operation: String?
    var solution: Double = 0
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        displayLabel.text = labelText
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func numberKeyTapped(sender: UIButton) {
        let keyTapped = sender.currentTitle
        let previousValue = cleanString(displayValue) // Problem occurs here
        print(previousValue)
        var newString = ""
        
        if isTyping {
            if let key = keyTapped, let previous = previousValue {
                newString = previous + key
                displayValue = getNumber(from: newString)
            }
        } else {
            displayValue = getNumber(from: keyTapped)
            isTyping = true
        }
        
        displayLabel.text = getString(from: displayValue)
    }
 
    /*
    @IBAction func decimalKeyTapped(sender: Key) {
        let previousValue = getString(from: displayValue)
        var newString = ""
        
        if hasDecimal == false {
            if let previous = previousValue {
                newString = previous + "."
            }
            
            hasDecimal = true
            isTyping = true
        } else {
            
        }
        
        displayValue = newString.numberValue
    }
    */
    
    /*
    @IBAction func deleteKeyTapped(sender: Key) {
        var text = "\(displayLabel.text ?? "")"
        text.remove(at: text.index(before: text.endIndex))
        
        if text != "" {
            displayLabel.text = text
        } else {
            clearDisplay()
        }
    }
    
    @IBAction func clearKeyTapped(sender: Key) {
        clearDisplay()
    }
    
    @IBAction func operationKeyTapped(sender: Key) {
        valueOne = displayLabel.text
        operation = sender.currentTitle
        // ^^ Replace with check for UIButton Tag? Or Use custom classes?
        
        isTyping = false
    }
    
    @IBAction func equalsKeyTapped(sender: Key) {
        // Check if user has input any text?
        // If not, perform previous operation with same value.
        
        valueTwo = displayLabel.text
        
        if let a = valueOne, let b = valueTwo {
            if operation == "+" {
                solution = Double(a)! + Double(a)!
            }
            if operation == "-" {
                solution = Double(a)! - Double(b)!
            }
        }
        
        // displayLabel.text = toStringValue(solution)
        // displayValue = solution
        isTyping = false
    }
    
    func clearDisplay() {
        displayLabel.text = "0"
        isTyping = false
        hasDecimal = false
    }
    */

}

