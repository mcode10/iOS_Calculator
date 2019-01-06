//
//  CalculatorEngine.swift
//  iOS Calculator
//
//  Created by Manas Paranjape on 12/15/18.
//  Copyright © 2018 DesignX6. All rights reserved.
//

import Foundation

var negative:Bool = false;

class CalculatorEngine {
    func hi () -> Void{
        print("Hi. It's me the Calculator Engine.")
    }
    struct IntStack {
        var items = [Double]()
        mutating func push(_ item: Double) {
            items.append(item)
        }
        mutating func pop() -> Double {
            return items.removeLast()
        }
    }
    func percenter (original: Double) -> Double {
        return (original/100)
    }
    func posNeg(original: String) -> String {
        var original2 = original
        if !negative {
            original2 = ("-" + original2)
            negative = true
        }
        else {
            original2.removeFirst()
            negative = false
        }
        return original2
    }
}
