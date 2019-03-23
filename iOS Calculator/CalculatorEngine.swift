//
//  CalculatorEngine.swift
//  iOS Calculator
//
//  Created by Manas Paranjape on 12/15/18.
//  Copyright © 2018 DesignX6. All rights reserved.
//

import Foundation

enum operatorCases: String {
    case add = "23"
    case subtract = "22"
    case multiply = "21"
    case divide = "20"
    case nothing
}

var currentValue:Double = 0;
var operation:operatorCases = .nothing;

class CalculatorEngine {
    func clear() {
        operation = .nothing;
        currentValue = 0
    }
    
    func returnAnswer() -> Double {
        return currentValue
    }
    struct OperandStack {
        var items = [Double]()
        mutating func push(_ item: Double) {
            items.append(item)
        }
        mutating func pop() -> Double {
            return items.removeLast()
        }
    }
    var operandStack = OperandStack()
    func percenter (original: Double) -> Double {
        return (original/100)
    }
    func posNeg(original: Double) -> Double {
        let original2 = original * Double(-1)
        return original2
    }
    func add(operand1: Double, operand2: Double) -> Double {
        return operand2 + operand1
    }
    func subtract(operand1: Double, operand2: Double) -> Double {
        return operand1 - operand2
    }
    func multiply(operand1: Double, operand2: Double) -> Double {
        return operand2 * operand1
    }
    func division(operand1: Double, operand2: Double) -> Double {
        if operand2 == Double(0) {
            print("You cannot divide by zero.")
        }
        return operand1 / operand2
    }
    func loadParameters(operand: Double, operationPassed: operatorCases) {
        if currentValue == Double(0) {
            operation = operationPassed
            operandStack.push(operand)
            currentValue = operand
            print(currentValue)
        } else {
            currentValue = operandStack.pop()
            print(currentValue)
            switch operation {
            case .add:
                currentValue = add(operand1: currentValue, operand2: operand)
            case .subtract:
                currentValue = subtract(operand1: currentValue, operand2: operand)
            case .multiply:
                currentValue = multiply(operand1: currentValue, operand2: operand)
            case .divide:
                currentValue = division(operand1: currentValue, operand2: operand)
            case .nothing:
                print("Either something went wrong, or we are in a default state")
            }
            operandStack.push(currentValue)
            print(currentValue)
            operation = operationPassed
        }
    }
}

