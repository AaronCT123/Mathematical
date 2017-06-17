//
//  ViewController.swift
//  Mathematical
//
//  Created by Aaron C-T on 6/15/17.
//  Copyright © 2017 Aaron C-T. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /*
    
    Answers are "solution"s shown in the "entryField"
    Think entryField might need to be a string that matches
    "entryField" needs to be set to 0 initially
    
    Press a number or decimal button, that value is placed into "entryField" and stored in a variable
    Press equal sign, calculations are performed and the "solution" is placed in the "entryField"
    Press percentage and number in "entryField" is stored in variable and divided by 100
     
    Back
    
    */

    @IBOutlet weak var entryField: UILabel!
    
    var entryString = "0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateEntryField()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
 
     If 0 is in entryString and user presses any NumberKey, replace with NumberKeyValue
     If 0 is in entryString and user presses ., concatenate to "0."
     
    */

    @IBAction func buttonPressed(sender: UIButton) {
        // Do something
                
        updateEntryField()
    }
    
    func updateEntryField() {
        entryField.text = entryString
    }
 
}

