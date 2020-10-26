//
//  ViewController.swift
//  CalculatorAppDemo
//
//  Created by Mansi Majethia on 2020-10-01.
//  Copyright © 2020 CentennialCollege. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    var Answer: String = ""
    var Num1 : Double = 0
    var Num2 : Double = 0
    var Tag = "+"
    let TagList = ["+","-","x","÷","+/-","sin","cos","tan","log"]
    var ModOccured = false
    var Decimal : Bool = false
    
    @IBOutlet weak var ResultLabel: UILabel!
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    // Number buttons Input
    @IBAction func OnNumberButton_Click(_ sender: UIButton)
    {
        if (ResultLabel.text! == "0" || ResultLabel.text! == "+" || ResultLabel.text! == "-" || ResultLabel.text! == "x" || ResultLabel.text! == "÷" || ModOccured ) && !(sender.tag == 0) && !(sender.tag==100)
        {
            ResultLabel.text = String(sender.tag)
        }
        else if !(ResultLabel.text! == "0") && !(sender.tag == 100)
        {
            ResultLabel.text = ResultLabel.text! + String(sender.tag)
        }
        Answer = sender.titleLabel!.text!
        switch sender.titleLabel!.text!
        {
        case ".":
            if(!ResultLabel.text!.contains("."))
            {
                ResultLabel.text! += "."
            }
        default:
            break
        }
    }
    // Operator buttons Input
    @IBAction func OnOperatorButton_Click(_ sender: UIButton)
    {
        if Num1==0 {
            Num1 = Double(ResultLabel.text!) ?? 0
            Decimal = false
        }
        else{
            // decimal = true
            Num2 = Double(ResultLabel.text!) ?? 0
            if Tag == "+"{
                Num1 += Num2
            }
            else if Tag == "-"{
                Num1 -= Num2
            }
            else if Tag == "x"{
                Num1 *= Num2
            }
            else if Tag == "÷"{
                Num1 /= Num2
            }
            
            
        }
        // sender.tag 4 is Percentage Button
        if sender.tag == 4{
            Num2 = Double(ResultLabel.text!) ?? 0
            Num1 = Num2/100
            ModOccured = true
            Decimal = true
        }
        
        if sender.tag == 10 || sender.tag == 4{
            Decimal = true
            ResultLabel.text = String(Num1)
            Num1 = 0
            Tag = "+"
        }
        else{
            ResultLabel.text = String(TagList[sender.tag])
            Tag = TagList[sender.tag]
        }
    }
    // Clear Button and Erase button Action
    @IBAction func OnClearButton(_ sender: UIButton)
    {
        Answer = sender.titleLabel!.text!
        switch sender.titleLabel!.text! {
        case "C":
            ResultLabel.text! = "0"
        case "⌫":
            ResultLabel.text!.popLast()
            if((ResultLabel.text!.count < 1) || (ResultLabel.text! == "-"))
            {
                ResultLabel.text! = "0"
        }
        default:
            if(ResultLabel.text == "0")
            {
                ResultLabel.text! = sender.titleLabel!.text!
            }
            else
            {
                ResultLabel.text! += sender.titleLabel!.text!
            }
        }
    }
    // Plus and minus button input
    @IBAction func OnSignButton(_ sender: UIButton)
    {
        if(ResultLabel.text! != "0")
        {
            if(!ResultLabel.text!.contains("-"))
            {
                ResultLabel.text!.insert("-", at: ResultLabel.text!.startIndex)
            }
            else
            {
                ResultLabel.text!.remove(at: ResultLabel.text!.startIndex)
            }
        }
        
    }
    
    @IBAction func PiButtom(_ sender: UIButton)
    {
        print(Double.pi)
        ResultLabel.text = String(Double.pi)
    }
    
    @IBAction func SinButton(_ sender: UIButton)
    {
        if Tag == "sin"{
            ResultLabel.text = String(sin(Num1))
            }
    }
    
    @IBAction func CosButton(_ sender: UIButton)
    {
        //print(cos(Num1))
        //if Tag == "cos"{
        ResultLabel.text = String(cos(Num1))
        //}
    }
    
    @IBAction func TanButton(_ sender: UIButton)
    {
        if Tag == "tan"{
            ResultLabel.text = String(tan(Num1))
        }
    }
    
    @IBAction func LogButton(_ sender: UIButton)
    {
        if Tag == "log"{
            ResultLabel.text = String(log(Num1))
        }
    }
}

