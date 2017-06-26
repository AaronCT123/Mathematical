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
    
    var displayValue: NSNumber = 0
    
    /*
    var valueOne: String?
    var valueTwo: String?
    var operation: String?
    var solution: Double = 0
    
    var isTyping: Bool = false
    var hasDecimal: Bool = false
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
        let number = sender.currentTitle
        let displayText = calculatorDisplay.text
        
        if isTyping {
            if let num = number, let display = displayText {
                calculatorDisplay.text = display + num
            }
        } else {
            calculatorDisplay.text = number
            isTyping = true
        }
    }
 
    /*
    @IBAction func decimalKeyTapped(sender: Key) {
        let text = displayLabel.text
        
        if hasDecimal == false {
            if let display = text {
                displayLabel.text = display + "."
            }
            hasDecimal = true
            isTyping = true
        }
    }
    
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
        
        // displayLabel.text = prettyString(solution)
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

