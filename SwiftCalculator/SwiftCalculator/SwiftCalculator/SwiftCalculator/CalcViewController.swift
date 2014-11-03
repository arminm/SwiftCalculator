//
//  ViewController.swift
//  SwiftCalculator
//
//  Created by Armin Mahmoudi on 2014-10-30.
//  Copyright (c) 2014 Armin. All rights reserved.
//

import UIKit

enum Operations: String {
    case addition = "+"
    case subtraction = "–"
    case multiplication = "×"
    case division = "÷"
}

class CalcViewController                    : UIViewController {
    @IBOutlet weak var resultLabel: UILabel!

    var 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func digitPressed(sender: UIButton) {
        resultLabel.text! += sender.titleLabel!.text!
    }
    
    @IBAction func clearPressed(sender: UIButton) {
        resultLabel.text = "0"
    }
    
    @IBAction func operationPressed(sender: UIButton) {
        switch sender.titleLabel!.text! {
        case Operations.addition.rawValue:
            println("It's addition")
        case Operations.subtraction.rawValue:
            println("It's subtraction")
        case Operations.multiplication.rawValue:
            println("It's multiplication")
        case Operations.division.rawValue:
            println("It's division")
        default:
            break
        }
    }
}