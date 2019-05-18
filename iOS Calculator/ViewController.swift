//
//  ViewController.swift
//  iOS Calculator
//
//  Created by Manas Paranjape on 9/22/18.
//  Copyright © 2018 DesignX6. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var answer:String = "";
    var operation:operatorCases = .add;
    var percent:Double = 0;
    var calcEngine = getCalcEngine();
    
    @IBOutlet var display_Panel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func percent_Sign(_ sender: UIButton, forEvent event: UIEvent) {
        let returnValue = calcEngine.percenter(original: Double(display_Panel.text!)!)
        display_Panel.text = String(returnValue)
    }
    @IBAction func decimalPoint(_ sender: UIButton, forEvent event: UIEvent) {
        if display_Panel.text!.contains(".") {
            display_Panel.text! = (display_Panel.text!)
        } else {
            display_Panel.text! = (display_Panel.text! + ".")
        }
    }
    @IBAction func positiveNegative(_ sender: UIButton, forEvent event: UIEvent) {
        let returnValue = calcEngine.positiveNegative(original: Double(display_Panel.text!)!)
        display_Panel.text = String(returnValue)
    }
    @IBAction func clear(_ sender: UIButton, forEvent event: UIEvent) {
        display_Panel.text = ("0")
        answer = "";
        operation = .add;
        percent = 0;
        calcEngine.clear()
    }
    @IBAction func operator_Key(_ sender: UIButton, forEvent event: UIEvent) {
        let operand: Double = Double(display_Panel.text!)!
        if answer == ""{
            switch sender.tag {
            case 23:
                operation = .add
            case 22:
                operation = .subtract
            case 21:
                operation = .multiply
            case 20:
                operation = .divide
            default:
                print("This shouldn't be happening")
                sleep(5)
                exit(0)
            }
            calcEngine.calcEngineInput(operand: operand, operationPassed: operation)
            display_Panel.text = "0"
        } else {
            switch sender.tag {
            case 23:
                operation = .add
            case 22:
                operation = .subtract
            case 21:
                operation = .multiply
            case 20:
                operation = .divide
            default:
                print("This shouldn't be happening")
                sleep(5)
                exit(0)
            }
            calcEngine.equalAfterthought(operationPassed: operation)
            answer = ""
            display_Panel.text = "0"
        }
    }
    @IBAction func numbers(_ sender: UIButton, forEvent event: UIEvent) {
        display_Panel.text = display_Panel.text! + String(sender.tag-1)
    }
    
    @IBAction func equalPressed(_ sender: UIButton, forEvent event: UIEvent) {
        answer = String(calcEngine.equalPressed(operand: Double(display_Panel.text!)!))
        display_Panel.text = answer
    }
}
