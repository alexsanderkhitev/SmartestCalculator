//
//  TodayViewController.swift
//  Calculator
//
//  Created by Александр Хитёв on 27/04/15.
//  Copyright (c) 2015 Alexsandr Khitev. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
    
    @IBOutlet weak var display: UILabel!
    
    var userWriteANumber: Bool = false
    var decimalEntered: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func digit(sender: UIButton) {
        //     AudioServicesPlaySystemSound(audioSound)
        let number = sender.currentTitle!
        if number == "0" && display.text == "0" {
            return
        }
        if arrayOp.count == 0 {
            arrayDigit.removeAll()
        }
        if userWriteANumber  {
            display.text = display.text! + number
        } else {
            display.text = number
            userWriteANumber = true
        }
        //println("display \(displayValue)")
        //println("array is \(arrayDigit)")
    }
    
    @IBAction func points(sender: UIButton) {
        //     AudioServicesPlaySystemSound(audioSound)
        let point = sender.currentTitle!
        if userWriteANumber && !decimalEntered {
            display.text = display.text! + point
            decimalEntered = true
            userWriteANumber = true
        }
    }
    
    @IBAction func clear(sender: UIButton) {
        // AudioServicesPlaySystemSound(audioSound)
        arrayDigit.removeAll()
        arrayOp.removeAll()
        display.text = "0" //displayStack() // remove !
        displayValue = 0
        equal()
    }
    
    @IBAction func clearC(sender: UIButton) {
        // AudioServicesPlaySystemSound(audioSound)
        //display.text = "0.0"
        displayValue = 0
        // equal()
        //println("is array \(arrayDigit)")
        //println(displayValue)
    }
    
    func displayStack() -> String! {
        return " ".join(arrayDigit.map{ "  \($0)" })
    }
    
    var arrayDigit = Array<Double>()
    
    func equal() {
        userWriteANumber = false
        decimalEntered = false
        arrayDigit.append(displayValue)
        // println("return digit = \(arrayDigit)")
    }
    
    var displayValue: Double! {
        get {
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        set {
            display.text = "\(newValue)"
            userWriteANumber = false
        }
    }
    
    @IBAction func equalVal(sender: UIButton) {
        //    AudioServicesPlaySystemSound(audioSound)
        if arrayDigit.count != 0 {
            equal()
        }
        if arrayOp.count == 1 {
            let x = arrayOp.last!
            switch x  {
            case "×": action { $0 * $1 }
            case "÷": action { $1 / $0 }
            case "−": action { $1 - $0 }
            case "+": action { $0 + $1 }
            case "±": action { -$0 }
            case "x²": action { $0 * $0 }
            default: break
            }
        }
        arrayOp.removeAll()
        //  println("\(arrayDigit)")
    }
    
    var arrayOp = Array<String>()
    
    @IBAction func operand(sender: UIButton) {
        //   AudioServicesPlaySystemSound(audioSound)
        decimalEntered = false
        var operation = sender.currentTitle!
        if userWriteANumber {
            equal()
        }
        if arrayOp.first == "√" || arrayOp.first == "±" || arrayOp.first == "x²" ||  arrayOp.first == "х³" || arrayOp.first == "%"  {
            arrayOp.removeAll()
        }
        if arrayOp == ["√"] {
            
        }
        if arrayOp.count == 1  { // do first do
            operation = arrayOp.first!
            arrayOp.removeAll()
            // println("op is first \(arrayOp)")
        }
        switch operation  {
        case "×": action { $0 * $1 }
        case "÷": action { $1 / $0 }
        case "−": action { $1 - $0 }
        case "+": action { $0 + $1 }
        case "±": action { -$0 }
        case "x²": action { $0 * $0 }
        case "х³": action { pow($0, 3.0)  }
        default: break
        }
        if arrayOp.count == 0 {
            operation = sender.currentTitle!
            arrayOp.append(operation)
        }
        // println("is op\(arrayOp)")
    }
    
    func action(operation: (Double, Double) -> Double) {
        if arrayDigit.count >= 2 {
            displayValue = operation(arrayDigit.removeLast(), arrayDigit.removeLast())
            equal()
        }
    }
    
    func action(operation: (Double) -> Double?) {
        if arrayDigit.count >= 1 {
            displayValue = operation(arrayDigit.removeLast())
            equal()
        }
    }
    
    @IBAction func pct(sender: UIButton) {
        //   AudioServicesPlaySystemSound(audioSound)
        if display.text != "Error" && display.text != ""{
            equal()
            if display.text! != "" &&  display.text! != "Error" && display.text != "0" && display.text != "0.0"{
                action { $0 / 100 }
            } else {
                //     AudioServicesPlaySystemSound(negativeSound)
            }
        } else {
            //   AudioServicesPlaySystemSound(negativeSound)
        }
    }
    
    @IBAction func root(sender: UIButton) {
        //    AudioServicesPlaySystemSound(audioSound)
        if display.text != "Error" && display.text != "Erro" && display.text != "Err" && display.text != "Er" && display.text != "E" {
            let number = displayValue
            if number > 0  {
                //AudioServicesPlaySystemSound(audioSound)
                display.text = "\(sqrt(number))"
                equal()
                //    println(displayValue)
            } else if number <= 0 {
                //   AudioServicesPlaySystemSound(negativeSound)
                display.text = "Error"
                arrayDigit.removeAll()
            }
        } else {
            //  AudioServicesPlaySystemSound(negativeSound)
        }
    }
    
    @IBAction func PI() {
        //    AudioServicesPlaySystemSound(audioSound)
        let pi = M_PI
        userWriteANumber = true
        if userWriteANumber {
            display.text = "\(pi)"
            //println("\(arrayDigit)")
        }
    }
    
    @IBAction func back(sender: UIButton) {
        // AudioServicesPlaySystemSound(audioSound)
        var coutEL = count(display.text!)
        if coutEL >= 2 && display.text != "0.0" && display.text != "0." && display.text! != "Error"{
            var backspace = dropLast(display.text!)
            display.text = backspace
        } else  if display.text! == "Error" {
            display.text = "0" //displayStack() // remove !
            displayValue = 0
        } else {
            //     AudioServicesPlaySystemSound(negativeSound)
        }
    }

    
    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)!) {
        // Perform any setup necessary in order to update the view.

        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData

        completionHandler(NCUpdateResult.NoData)
    }
    
    func widgetMarginInsetsForProposedMarginInsets(defaultMarginInsets: UIEdgeInsets) -> UIEdgeInsets {
        return UIEdgeInsetsZero
    }
    
}
