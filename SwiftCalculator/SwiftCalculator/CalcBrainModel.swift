//
//  CalcBrainModel.swift
//  SwiftCalculator
//
//  Created by Armin Mahmoudi on 2014-11-02.
//  Copyright (c) 2014 Armin. All rights reserved.
//

import Foundation

enum Operations: String {
    case addition = "+"
    case subtraction = "–"
    case multiplication = "×"
    case division = "÷"
}

class CalcBrainModel {
    var operand : Double?
    var total : Double?
    
    var operation : Operations?
    
    init () {}
    deinit {
        reset()
    }
    
    func performOperation() -> String? {
        if operand != nil && total != nil && operation != nil {
            var result : Double
            switch operation! {
            case .addition:
                result = total! + operand!
            case .subtraction:
                result = total! - operand!
            case .multiplication:
                result = total! * operand!
            case .division:
                result = total! / operand!
            default:
                return nil
            }
            
            operand = nil
            total = result
            if floor(result) == result && result < Double(Int.max) && result > Double(Int.min) {
                return "\(Int(result))"
            } else {
                return "\(result)"
            }
        } else if total == nil && operand != nil {
            total = operand
            operand = nil
            return nil
        } else {
            return nil
        }
    }
    
    func reset () {
        operand = nil
        total = nil
        operation = nil
    }
}