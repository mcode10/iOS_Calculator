//
//  CalcEngineProtocol.swift
//  iOS Calculator
//
//  Created by Manas Paranjape on 3/30/19.
//  Copyright © 2019 DesignX6. All rights reserved.
//

import Foundation

enum operatorCases: String {
    case add = "23"
    case subtract = "22"
    case multiply = "21"
    case divide = "20"
    case nothing
}

protocol CalcEngineProtocol {
    func percenter(original: Double) -> Double
    func posNeg(original: Double) -> Double
    func clear()
    func returnAnswer() -> Double
}
