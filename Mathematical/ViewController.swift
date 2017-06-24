//
//  ViewController.swift
//  Mathematical
//
//  Created by Aaron C-T on 6/15/17.
//  Copyright © 2017 Aaron C-T. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var valueOne: String?
    var valueTwo: String?
    var operation: String?
    var solution: Double = 0
    
    var isTyping: Bool = false
    var isFraction: Bool = false
    
    @IBOutlet weak var calculatorDisplay: UILabel!
    
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
 
    @IBAction func decimalKeyTapped(sender: UIButton) {
        let displayText = calculatorDisplay.text
        
        if isFraction == false {
            if let display = displayText {
                calculatorDisplay.text = display + "."
            }
            isFraction = true
            isTyping = true
        }
    }
    
    @IBAction func deleteKeyTapped(sender: UIButton) {
        var displayText = "\(calculatorDisplay.text ?? "")"
        displayText.remove(at: displayText.index(before: displayText.endIndex))
        
        if displayText != "" {
            calculatorDisplay.text = displayText
        } else {
            clearScreen()
        }
    }
    
    @IBAction func clearKeyTapped(sender: UIButton) {
        clearScreen()
    }
    
    @IBAction func operationKeyTapped(sender: UIButton) {
        valueOne = calculatorDisplay.text
        operation = sender.currentTitle
        // ^^ Replace with check for UIButton Tag? Or Use custom classes?
        
        isTyping = false
    }
    
    @IBAction func equalsKeyTapped(sender: UIButton) {
        // Check if user has input any text?
        // If not, perform previous operation with same value.
        
        valueTwo = calculatorDisplay.text
        
        if let a = valueOne, let b = valueTwo {
            if operation == "+" {
                solution = Double(a)! + Double(b)!
            }
            if operation == "-" {
                solution = Double(a)! - Double(b)!
            }
        }
        
        // Check whether you can display solution as an Int
        if (solution.truncatingRemainder(dividingBy: 1)) == 0 {
            // NSNumberFormatter extension type?
        } else {
            calculatorDisplay.text = "\(solution)"
        }
        
        isTyping = false
    }
    
    func clearScreen() {
        calculatorDisplay.text = "0"
        isTyping = false
    }
    
    func cleanValueString(_ value: String?) -> String? {
        guard let value = value else {
            // Wtf do I do here?
            return nil
        }
        
        
    }
    
}

