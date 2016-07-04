//
//  Calculator.swift
//  Smartest Calculator
//
//  Created by Александр Хитёв on 19/03/15.
//  Copyright (c) 2015 Alexsandr Khitev. All rights reserved.
//

import UIKit
import AVFoundation
import Darwin

class Calculator: UIViewController {

    @IBOutlet weak var display: UILabel!
    @IBOutlet weak var buttonequal: UIButton!
    @IBOutlet weak var button0: UIButton!
    @IBOutlet weak var buttonpoint: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button6: UIButton!
    @IBOutlet weak var button5: UIButton!
    @IBOutlet weak var button4: UIButton!
    @IBOutlet weak var button9: UIButton!
    @IBOutlet weak var button8: UIButton!
    @IBOutlet weak var button7: UIButton!
    @IBOutlet weak var buttonAC: UIButton!
    @IBOutlet weak var buttonC: UIButton!
    @IBOutlet weak var buttonBack: UIButton!
    @IBOutlet weak var buttonDivision: UIButton!
    @IBOutlet weak var buttonMulti: UIButton!
    @IBOutlet weak var buttonPlus: UIButton!
    @IBOutlet weak var buttonMinus: UIButton!
    @IBOutlet weak var buttonPlusMinus: UIButton!
    @IBOutlet weak var buttonPi: UIButton!
    @IBOutlet weak var buttonPCT: UIButton!
    @IBOutlet weak var buttonSQRT: UIButton!
    @IBOutlet weak var buttonX3: UIButton!
    @IBOutlet weak var buttonX2: UIButton!
    //11.05.15
    @IBOutlet weak var button2X: UIButton!
    @IBOutlet weak var buttonRandom: UIButton!
    @IBOutlet weak var buttonSin: UIButton!
    @IBOutlet weak var buttonCos: UIButton!
    @IBOutlet weak var buttonTan: UIButton!
    @IBOutlet weak var buttonSinH: UIButton!
    @IBOutlet weak var buttonCosH: UIButton!
    @IBOutlet weak var buttonTanH: UIButton!
    @IBOutlet weak var buttonEX: UIButton!
    @IBOutlet weak var buttonE: UIButton!
    // iPad version
    @IBOutlet weak var buttoniPadSin: UIButton!
    @IBOutlet weak var buttoniPadCos: UIButton!
    @IBOutlet weak var buttoniPadTan: UIButton!
    @IBOutlet weak var buttoniPadSinH: UIButton!
    @IBOutlet weak var buttoniPadCosH: UIButton!
    @IBOutlet weak var buttoniPadTanH: UIButton!
    @IBOutlet weak var buttoniPadRandom: UIButton!
    @IBOutlet weak var buttoniPad2X: UIButton!
    @IBOutlet weak var buttoniPadE: UIButton!
    @IBOutlet weak var buttoniPadEX: UIButton!
    
    var userWriteANumber: Bool = false
    var decimalEntered: Bool = false
    let audioSound: SystemSoundID = 1104
    let negativeSound: SystemSoundID = 1053
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonequal.layer.borderColor = UIColor.blackColor().CGColor
        buttonequal.layer.borderWidth = 0.5
        button0.layer.borderColor = UIColor.blackColor().CGColor
        button0.layer.borderWidth = 0.5
        buttonpoint.layer.borderColor = UIColor.blackColor().CGColor
        buttonpoint.layer.borderWidth = 0.5
        button3.layer.borderColor = UIColor.blackColor().CGColor
        button3.layer.borderWidth = 0.5
        button2.layer.borderColor = UIColor.blackColor().CGColor
        button2.layer.borderWidth = 0.5
        button1.layer.borderColor = UIColor.blackColor().CGColor
        button1.layer.borderWidth = 0.5
        button6.layer.borderColor = UIColor.blackColor().CGColor
        button6.layer.borderWidth = 0.5
        button5.layer.borderColor = UIColor.blackColor().CGColor
        button5.layer.borderWidth = 0.5
        button4.layer.borderColor = UIColor.blackColor().CGColor
        button4.layer.borderWidth = 0.5
        button9.layer.borderColor = UIColor.blackColor().CGColor
        button9.layer.borderWidth = 0.5
        button8.layer.borderColor = UIColor.blackColor().CGColor
        button8.layer.borderWidth = 0.5
        button7.layer.borderColor = UIColor.blackColor().CGColor
        button7.layer.borderWidth = 0.5
        buttonAC.layer.borderColor = UIColor.blackColor().CGColor
        buttonAC.layer.borderWidth = 0.5
        buttonC.layer.borderColor = UIColor.blackColor().CGColor
        buttonC.layer.borderWidth = 0.5
        buttonBack.layer.borderColor = UIColor.blackColor().CGColor
        buttonBack.layer.borderWidth = 0.5
        buttonDivision.layer.borderColor = UIColor.blackColor().CGColor
        buttonDivision.layer.borderWidth = 0.5
        buttonMulti.layer.borderColor = UIColor.blackColor().CGColor
        buttonMulti.layer.borderWidth = 0.5
        buttonMinus.layer.borderColor = UIColor.blackColor().CGColor
        buttonMinus.layer.borderWidth = 0.5
        buttonPlus.layer.borderColor = UIColor.blackColor().CGColor
        buttonPlus.layer.borderWidth = 0.5
        buttonPlusMinus.layer.borderColor = UIColor.blackColor().CGColor
        buttonPlusMinus.layer.borderWidth = 0.5
        buttonPi.layer.borderColor = UIColor.blackColor().CGColor
        buttonPi.layer.borderWidth = 0.5
        buttonPCT.layer.borderColor = UIColor.blackColor().CGColor
        buttonPCT.layer.borderWidth = 0.5
        buttonSQRT.layer.borderColor = UIColor.blackColor().CGColor
        buttonSQRT.layer.borderWidth = 0.5
        buttonX3.layer.borderColor = UIColor.blackColor().CGColor
        buttonX3.layer.borderWidth = 0.5
        buttonX2.layer.borderColor = UIColor.blackColor().CGColor
        buttonX2.layer.borderWidth = 0.5
        // 11.05.15
        button2X.layer.borderColor = UIColor.blackColor().CGColor
        button2X.layer.borderWidth = 0.5
        buttonRandom.layer.borderColor = UIColor.blackColor().CGColor
        buttonRandom.layer.borderWidth = 0.5
        buttonSin.layer.borderColor = UIColor.blackColor().CGColor
        buttonSin.layer.borderWidth = 0.5
        buttonCos.layer.borderColor = UIColor.blackColor().CGColor
        buttonCos.layer.borderWidth = 0.5
        buttonTan.layer.borderColor = UIColor.blackColor().CGColor
        buttonTan.layer.borderWidth = 0.5
        buttonSinH.layer.borderColor = UIColor.blackColor().CGColor
        buttonSinH.layer.borderWidth = 0.5
        buttonCosH.layer.borderColor = UIColor.blackColor().CGColor
        buttonCosH.layer.borderWidth = 0.5
        buttonTanH.layer.borderColor = UIColor.blackColor().CGColor
        buttonTanH.layer.borderWidth = 0.5
        buttonEX.layer.borderColor = UIColor.blackColor().CGColor
        buttonEX.layer.borderWidth = 0.5
        buttonE.layer.borderColor = UIColor.blackColor().CGColor
        buttonE.layer.borderWidth = 0.5
        // iPad version
        buttoniPadSin.layer.borderColor = UIColor.blackColor().CGColor
        buttoniPadSin.layer.borderWidth = 0.5
        buttoniPadCos.layer.borderColor = UIColor.blackColor().CGColor
        buttoniPadCos.layer.borderWidth = 0.5
        buttoniPadTan.layer.borderColor = UIColor.blackColor().CGColor
        buttoniPadTan.layer.borderWidth = 0.5
        buttoniPadTanH.layer.borderColor = UIColor.blackColor().CGColor
        buttoniPadTanH.layer.borderWidth = 0.5
        buttoniPadSinH.layer.borderColor = UIColor.blackColor().CGColor
        buttoniPadSinH.layer.borderWidth = 0.5
        buttoniPadCosH.layer.borderColor = UIColor.blackColor().CGColor
        buttoniPadCosH.layer.borderWidth = 0.5
        buttoniPadRandom.layer.borderColor = UIColor.blackColor().CGColor
        buttoniPadRandom.layer.borderWidth = 0.5
        buttoniPad2X.layer.borderColor = UIColor.blackColor().CGColor
        buttoniPad2X.layer.borderWidth = 0.5
        buttoniPadE.layer.borderColor = UIColor.blackColor().CGColor
        buttoniPadE.layer.borderWidth = 0.5
        buttoniPadEX.layer.borderColor = UIColor.blackColor().CGColor
        buttoniPadEX.layer.borderWidth = 0.5
    }
    
    @IBAction func digit(sender: UIButton) {
        AudioServicesPlaySystemSound(audioSound)
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
    }
    
    @IBAction func points(sender: UIButton) {
        AudioServicesPlaySystemSound(audioSound)
        let point = sender.currentTitle!
        if userWriteANumber && !decimalEntered {
            display.text = display.text! + point
            decimalEntered = true
            userWriteANumber = true
        }
    }
    
    @IBAction func clear(sender: UIButton) {
        AudioServicesPlaySystemSound(audioSound)
        arrayDigit.removeAll()
        arrayOp.removeAll()
        display.text = "0" //displayStack() // remove !
        displayValue = 0
        equal()
    }
    
    @IBAction func clearC(sender: UIButton) {
        AudioServicesPlaySystemSound(audioSound)
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
        AudioServicesPlaySystemSound(audioSound)
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
        //println("\(arrayDigit)")
    }
    
    var arrayOp = Array<String>()
    
    @IBAction func operand(sender: UIButton) {
        AudioServicesPlaySystemSound(audioSound)
        decimalEntered = false
        var operation = sender.currentTitle!
        if userWriteANumber {
            equal()
        }
        if arrayOp.first == "√" || arrayOp.first == "±" || arrayOp.first == "x²" ||  arrayOp.first == "х³" || arrayOp.first == "%" || arrayOp.first == "tanh" || arrayOp.first == "cosh" || arrayOp.first == "sinh" || arrayOp.first == "sin" || arrayOp.first == "tan" || arrayOp.first == "cos" || arrayOp.first == "2x" {
            arrayOp.removeAll()
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
        //11.05
        case "sin": action {sin(2*M_PI*$0/360) } //sin
        case "cos": action { cos(2*M_PI*$0/360) }
        case "tan": action { tan(2*M_PI*$0/360) }
        case "sinh": action { sinh($0) }
        case "cosh": action { cosh($0) }
        case "tanh": action { tanh($0) }
        case "2x": action { pow(2, $0) }
        //11.05
        default: break
        }
        if arrayOp.count == 0 {
            operation = sender.currentTitle!
            arrayOp.append(operation)
        }
         //println("is op\(arrayOp)")
        //println("is arrayDigit \(arrayDigit)")
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
        AudioServicesPlaySystemSound(audioSound)
        if display.text != "Error" && display.text != "" && display.text != "-∞"{
            equal()
            if display.text! != "" &&  display.text! != "Error" && display.text != "0" && display.text != "0.0"{
                action { $0 / 100 }
            } else {
                AudioServicesPlaySystemSound(negativeSound)
            }
        } else {
            AudioServicesPlaySystemSound(negativeSound)
        }
    }
    
    @IBAction func root(sender: UIButton) {
        AudioServicesPlaySystemSound(audioSound)
             if display.text != "Error" && display.text != "-∞" {
                let number = displayValue
                if number > 0  {
                    AudioServicesPlaySystemSound(audioSound)
                    display.text = "\(sqrt(number))"
                    equal()
             //    println(displayValue)
                } else if number <= 0 {
                    AudioServicesPlaySystemSound(negativeSound)
                    display.text = "Error"
                    arrayDigit.removeAll()
                }
             } else {
                AudioServicesPlaySystemSound(negativeSound)
            } 
        }
    
    //11.05.15
    @IBAction func random(sender: UIButton) /* good job */ {
        AudioServicesPlaySystemSound(audioSound)
        var random = rand()
        display.text = "\(random)"
        equal()
        if arrayDigit.count > 0 {
            var lastX = arrayDigit.last!
            arrayDigit.removeAll()
            display.text = "\(lastX)"
            equal()
        }
    }
    
    @IBAction func e(sender: UIButton) {
        AudioServicesPlaySystemSound(audioSound)
        var e: String = "2.718281828459045"
        userWriteANumber = true
        if userWriteANumber {
            display.text = e
        }
    }
    
    @IBAction func root3(sender: UIButton) {
        AudioServicesPlaySystemSound(audioSound)
        if display.text != "Error" && display.text != "-∞" {
            let number = displayValue
            if number > 0  {
                AudioServicesPlaySystemSound(audioSound)
                display.text = "\(pow(number, 1.0/3.0))"
                equal()
                //    println(displayValue)
            } else if number <= 0 {
                AudioServicesPlaySystemSound(negativeSound)
                display.text = "Error"
                arrayDigit.removeAll()
            }
        } else {
            AudioServicesPlaySystemSound(negativeSound)
        }
    }
    

    //
    
    @IBAction func PI() {
        AudioServicesPlaySystemSound(audioSound)
        let pi = M_PI
        userWriteANumber = true
        if userWriteANumber {
            display.text = "\(pi)"
            //println("\(arrayDigit)")
        }
    }
    
    @IBAction func back(sender: UIButton) {
        AudioServicesPlaySystemSound(audioSound)
        var coutEL = count(display.text!)
        if coutEL >= 2 && display.text != "0.0" && display.text != "0." && display.text! != "Error" && display.text != "-∞"{
            var backspace = dropLast(display.text!)
            display.text = backspace
        } else if display.text! == "Error" || display.text! == "-∞"{
            display.text = "0" //displayStack() // remove !
            displayValue = 0
        } else {
            AudioServicesPlaySystemSound(negativeSound)
        }
    }
}
