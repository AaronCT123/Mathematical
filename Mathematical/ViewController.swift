//
//  ViewController.swift
//  Mathematical
//
//  Created by Aaron C-T on 6/15/17.
//  Copyright © 2017 Aaron C-T. All rights reserved.
//

import UIKit
import CoreGraphics

class ViewController: UIViewController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var divideKey: Key!
    @IBOutlet weak var multiplyKey: Key!
    @IBOutlet weak var subtractKey: Key!
    @IBOutlet weak var addKey: Key!
    @IBOutlet weak var equalsKey: Key!
    
    /*
     
     variable x/y <- userInput -> displayText
     
     */
    
    // Display Label + User Input
    // Final implementation should have separate values for User Input and clean Display String.
    var displayText = ""
    var userInput = ""
    
    // Variables used for operation
    var x: Double?
    var y: Double?
    
    // Variables used for animation
    let animLength = 0.3
    let highlightColor = UIColor.white
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Set up calculator key button states
        let divideColor = UIColor.init(red: 0.89, green: 0.43, blue: 0.97, alpha: 1.0)
        divideKey.setTitleColor(highlightColor, for: .highlighted)
        divideKey.setBackgroundImage(Key.imageFromColor(color: divideColor), for: .selected)
        divideKey.setTitleColor(UIColor.black, for: .selected)
        
        let multiplyColor = UIColor.init(red: 1.0, green: 0.78, blue: 0.0, alpha: 1.0)
        multiplyKey.setTitleColor(highlightColor, for: .highlighted)
        multiplyKey.setBackgroundImage(Key.imageFromColor(color: multiplyColor), for: .selected)
        multiplyKey.setTitleColor(UIColor.black, for: .selected)
        
        let subtractColor = UIColor.init(red: 1.0, green: 0.27, blue: 0.27, alpha: 1.0)
        subtractKey.setTitleColor(highlightColor, for: .highlighted)
        subtractKey.setBackgroundImage(Key.imageFromColor(color: subtractColor), for: .selected)
        subtractKey.setTitleColor(UIColor.black, for: .selected)
        
        let addColor = UIColor.init(red: 0.25, green: 0.85, blue: 0.72, alpha: 1.0)
        addKey.setTitleColor(highlightColor, for: .highlighted)
        addKey.setBackgroundImage(Key.imageFromColor(color: addColor), for: .selected)
        addKey.setTitleColor(UIColor.black, for: .selected)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Take User Input and add to Display.
    // Currently doesn’t take original 0 into account.
    @IBAction func handleInput(sender: Key) {
        deselectOperationKeys()
        highlightKey(sender)
        
        let input = sender.currentTitle!
        var newValue = ""
        
        if input == "." {
            guard !userInput.contains(".") else {
                if userInput.last == "." {
                    let newString = userInput.dropLast()
                    newValue = String(newString)
                    
                    updateDisplay(with: newValue)
                }
                return
            }
            newValue = userInput + input
            updateDisplay(with: newValue)
        } else if displayLabel.text == "0" {
            newValue = input
        } else {
            newValue = userInput + input
        }
        
        updateDisplay(with: newValue)
    }

    // Delete Key Functionality
    // Remove last character from Display string
    @IBAction func backspace(sender: Key) {
        deselectOperationKeys()
        
        var newValue = String(userInput.dropLast())
        
        if newValue == "" {
                newValue = "0"
        }
        
        updateDisplay(with: newValue)
    }
    
    @IBAction func negativeKeyTapped(sender: Key) {
        var newValue = ""
        
        if userInput.hasPrefix("-") {
            let newString = userInput.dropFirst()
            newValue = String(newString)
        } else {
            newValue = "-" + userInput
        }
        
        userInput = newValue
        displayText = number(from: newValue)!
        
        displayLabel.text = displayText
    }
    
    @IBAction func clearKeyTapped(sender: Key) {
        deselectOperationKeys()
        clearScreen()
        // Clear input of valueY if operation was tapped, otherwise clearScreen
    }
 
    @IBAction func operationKeyTapped(sender: Key) {
        deselectOperationKeys()
        
        selectKey(sender)
        
        x = Double(userInput)
        userInput = ""
        updateDisplay("0")
    }
    
    @IBAction func equalsKeyTapped(sender: Key) {
        y = Double(userInput)
    }

    
    // Get Number from String
    func number(from string: String) -> String? {
        var newString: String? = ""
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        numberFormatter.usesSignificantDigits = true
        numberFormatter.minimumSignificantDigits = 1
        numberFormatter.maximumSignificantDigits = 10
        
        if userInput.contains(".") && userInput.count <= 2 {
            numberFormatter.minimumFractionDigits = 1
            numberFormatter.minimumSignificantDigits = 2
        } else if userInput.contains(".") {
            numberFormatter.minimumSignificantDigits = 1
        }
        
        let number = numberFormatter.number(from: string)
        
        if let num = number {
            newString = numberFormatter.string(from: num)
        } else {
            newString = ""
        }
        
        return newString
    }
    
    // Takes user Input into account and updates the Display
    // Final implementation should take String and turn it into a Clean String with commas, etc.
    func updateDisplay(_ newValue: String) {
        userInput = newValue
        displayText = number(from: newValue)!
        
        displayLabel.text = displayText
    }
    
    func updateDisplay(with newValue: String) {
        let string = newValue
        let charCount = newValue.count
        var hasDecimal = false
        
        // Limit userInput character
        if newValue.contains(".") {
            hasDecimal = true
        }

        if (charCount <= 10 && hasDecimal == false) || (charCount <= 11 && hasDecimal == true) {
            updateDisplay(string)
        }
    }
    
    func highlightKey(_ key: Key) {
        UIView.transition(
            with: key,
            duration: animLength,
            options: [.transitionCrossDissolve,.allowUserInteraction],
            animations: {key.isHighlighted = true},
            completion: nil)
    }
    
    func selectKey(_ key: Key) {
        UIView.transition(
            with: key,
            duration: animLength,
            options: [.transitionCrossDissolve,.allowUserInteraction],
            animations: {key.isSelected = true},
            completion: nil)
    }
    
    func deselectOperationKeys() {
        if divideKey.isSelected {
            UIView.transition(
                with: divideKey,
                duration: animLength,
                options: [.transitionCrossDissolve,.allowUserInteraction],
                animations: {self.divideKey.isSelected = false},
                completion: nil)
        } else if multiplyKey.isSelected {
            UIView.transition(
                with: multiplyKey,
                duration: animLength,
                options: [.transitionCrossDissolve,.allowUserInteraction],
                animations: {self.multiplyKey.isSelected = false},
                completion: nil)
        } else if subtractKey.isSelected {
            UIView.transition(
                with: subtractKey,
                duration: animLength,
                options: [.transitionCrossDissolve,.allowUserInteraction],
                animations: {self.subtractKey.isSelected = false},
                completion: nil)
        } else if addKey.isSelected {
            UIView.transition(
                with: addKey,
                duration: animLength,
                options: [.transitionCrossDissolve,.allowUserInteraction],
                animations: {self.addKey.isSelected = false},
                completion: nil)
        }
    }
    
    func clearScreen() {
        updateDisplay("0")
    }
    
    // Operation Functions
    // call CalculatorOperation.___.applyOperation() when button is tapped
    enum CalculatorOperation: String {
        case add = "+"
        case subtract = "-"
        case multiply = "*"
        case divide = "/"
        
        func applyOperation(to x: Double, y: Double) -> Double {
            switch self {
            case .add:
                return x + y
            case .subtract:
                return x - y
            case .multiply:
                return x * y
            case .divide:
                return x / y
            }
        }
    }
    
}
