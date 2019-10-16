//
//  ViewController.swift
//  CalculatorHW2EricOusouphan
//
//  Created by mcs on 10/10/19.
//  Copyright © 2019 EricOusouphan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numbersOnScreen:Double = 0
    var previousNumber:Double = 0
    var performingMath = false
    var operation = 0
    var decimal: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
   
    @IBOutlet weak var Value: UILabel!

    @IBAction func buttons(_ sender: UIButton) {
        
        if performingMath == true
        {
            Value.text = String(sender.tag-1)
            numbersOnScreen = Double(Value.text!)!
            performingMath = false
            
        }
        
        else {
            Value.text = Value.text! + String(sender.tag-1)
            numbersOnScreen = Double(Value.text!)!
        }
        
    }
    
    
    
    @IBAction func commands(_ sender: UIButton) {
        if Value.text != "" && sender.tag != 11 && sender.tag != 18
        {
            
            previousNumber = Double(Value.text!)!
            
            if sender.tag == 12 //plus/minus
            {
                Value.text = "+/-"
            }
            else if sender.tag == 13 //percentage
            {
                Value.text = "%"
            }
            else if sender.tag == 14 //divide
                       {
                           Value.text = "/"
                       }
            else if sender.tag == 15 //multiply
                       {
                           Value.text = "*"
                       }
            else if sender.tag == 16 //subtraction
                       {
                           Value.text = "-"
                       }
            else if sender.tag == 17 //addition
                       {
                        Value.text = "+"
                       }
            else if sender.tag == 19 //decimal
                       {
                        guard decimal else {
                        Value.text?.append(".")
                        decimal = true
                        return
                       }
            operation = sender.tag
        performingMath = true
    }
    
        else if sender.tag ==  18
        {
            if operation == 12 { //negative
             Value.text = String(numbersOnScreen * -1)
            }
           else if operation == 13 { //percentage
               Value.text = String(numbersOnScreen / 100)
            }
           else if operation == 14 { //division
                Value.text = String(previousNumber / numbersOnScreen)
            }
           else if operation == 15 { //multiplication
                Value.text = String(previousNumber * numbersOnScreen)
            }
           else if operation == 16 { //subtraction
             Value.text = String(previousNumber - numbersOnScreen)
            }
           else if operation == 17 { //addition
             Value.text = String(previousNumber + numbersOnScreen)
            }
          
            else if sender.tag == 11 {
                Value.text = ""
                previousNumber = 0
                numbersOnScreen = 0
                operation = 0
            }
            
        }
    
    
    
    }
    

    
    


}
}

