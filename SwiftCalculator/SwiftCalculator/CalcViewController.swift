//
//  ViewController.swift
//  SwiftCalculator
//
//  Created by Armin Mahmoudi on 2014-10-30.
//  Copyright (c) 2014 Armin. All rights reserved.
//

import UIKit

class CalcViewController : UIViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    
    // brain is the model that does the calculations and holds onto the operands and operations
    lazy var brain = CalcBrainModel()

    @IBAction func digitPressed(sender: UIButton) {
        
        // Check if pressing 0 at the beginning:
        if resultLabel.text! == "0" && sender.titleLabel!.text! == "0" {
            brain.operand = 0.0
            return
        }
        
        // Clear the resultLabel text before appending the first non-zero digit
        if brain.operand == nil || brain.operand == 0.0{
            resultLabel.text = ""
        }
        
        // Append digits
        resultLabel.text! += sender.titleLabel!.text!
        
        // Set brain's operand
        brain.operand = (resultLabel.text! as NSString).doubleValue
    }
    
    @IBAction func clearPressed(sender: UIButton) {
        
        // reset resultLabel
        resultLabel.text = "0"
        
        //reset the brain
        brain.reset()
    }
    
    @IBAction func operationPressed(sender: UIButton) {
        
        // Perform previous operation if a new operation button is pressed
        // (result would be nil, thus not triggering, for the first operation press)
        if let result = brain.performOperation() {
            
            // Check for decimals
            if floor(result) == result && result < Double(Int.max) && result > Double(Int.min) {
                resultLabel.text = "\(Int(result))" // No .0 decimal shown
            } else {
                resultLabel.text =  "\(result)"
            }
        }

        // Check for operation type and set brain.operation
        switch sender.titleLabel!.text! {
            
        case Operations.addition.rawValue:
            brain.operation = .addition
            
        case Operations.subtraction.rawValue:
            brain.operation = .subtraction
            
        case Operations.multiplication.rawValue:
            brain.operation = .multiplication
            
        case Operations.division.rawValue:
            brain.operation = .division
            
        default:
            break
        }
    }
}