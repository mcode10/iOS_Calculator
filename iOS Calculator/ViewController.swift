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
    var operation:String = "";
    var percent:Double = 0;
    var calcEngine = CalculatorEngine();
    
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
        let returnValue = calcEngine.posNeg(original: Double(display_Panel.text!)!)
        display_Panel.text = String(returnValue)
    }
    @IBAction func clear(_ sender: UIButton, forEvent event: UIEvent) {
        display_Panel.text = ("0")
        answer = "";
        operation = "";
        percent = 0;
        calcEngine.clear()
    }
    @IBAction func operator_Key(_ sender: UIButton, forEvent event: UIEvent) {
        let operand: Double = Double(display_Panel.text!)!
        operation = String(sender.tag)
        calcEngine.loadParameters(operand: operand, operationPassed: operation)
        display_Panel.text = "0"
    }
    @IBAction func numbers(_ sender: UIButton, forEvent event: UIEvent) {
        display_Panel.text = display_Panel.text! + String(sender.tag-1)
    }
    
    @IBAction func equal_Pressed(_ sender: UIButton, forEvent event: UIEvent) {
        calcEngine.loadParameters(operand: Double(display_Panel.text!)!)
        answer = String(calcEngine.returnAnswer())
        display_Panel.text = answer
    }
}
