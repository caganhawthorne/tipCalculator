//
//  ViewController.swift
//  Tip Calculator
//
//  Created by caganhawthorne on 6/30/15.
//  Copyright © 2015 Cagan Hawthorne. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var costPerPersonLabel: UILabel!
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var percentages: UISegmentedControl!
    @IBOutlet weak var peopleStepper: UIStepper!
    @IBOutlet weak var numberOfPeopleLabel: UILabel!
    
    var percent = 0.15
    var numberOfPeople = 1.0
    var price = 0.0
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tipLabel.text = ""
        totalLabel.text = ""
        costPerPersonLabel.text = ""

    }
    
    
    func validateEntry(entry: String) ->Double
    {
        if let value = Double(entry) {
            return value
        }
        else {
            return 0
        }
    }
    
    
    func recalculate()
    {
        let tip = price * percent
        let total = tip + price
        let costPP = total / numberOfPeople
        let formatter = NSNumberFormatter()
        formatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        tipLabel.text = "" + formatter.stringFromNumber(tip)!
        totalLabel.text = "" + formatter.stringFromNumber(total)!
        costPerPersonLabel.text = "" + formatter.stringFromNumber(costPP)!
    }
    

    
 
    @IBAction func billDidChange(sender: AnyObject) {
        price=validateEntry(billTextField.text!)
        recalculate()
    }
    

    
    @IBAction func tipOptionChanged(sender: AnyObject)
    {
        
        switch (percentages.selectedSegmentIndex)
        {
        case 0:
            percent = 0.1
        case 1:
            percent = 0.15
        case 2:
            percent = 0.2
        case 3:
            percent = 0.25
        default:
            print("Error")
        }
        
        self.view.endEditing(true)
        recalculate()
        
    }
    
    @IBAction func onStepperTapped(sender: AnyObject)
    {
        numberOfPeople = peopleStepper.value
        numberOfPeopleLabel.text = String(Int(numberOfPeople))
        recalculate()
        self.view.endEditing(true)
    }
    
}

