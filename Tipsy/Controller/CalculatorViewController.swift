//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!

    
    var tip:Float = 0.10
    var numberOfPeople:Float = 2
    var amount:Float = 0.0
    var totalPerPerson: Float = 0.0

    @IBAction func tipChanged(_ sender: UIButton) {
        
        //deselect all of them
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        //makes sender salected
        sender.isSelected = true
        
        //Get the current title of the button that was pressed.
        let buttonTittle = sender.currentTitle!
        
        //Remove the last character (%) from the title then turn it back into a String.
        let buttonTittleMinusPercentSign = String(buttonTittle.dropLast())
        
        //Turn the String into a Double.
        let buttonTittleAsNumbner = Float(buttonTittleMinusPercentSign)!
        
        //Divide the percent expressed out of 100 into a decimal e.g. 10 becomes 0.1
        tip = buttonTittleAsNumbner / 100
        
        //Dismiss keyboard when user tap on tip
        billTextField.endEditing(true)
        
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
    
        numberOfPeople = Float(sender.value)
        let numberOfPeopleString = String(format: "%.0f", numberOfPeople)
        splitNumberLabel.text = numberOfPeopleString
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        if  let _ = billTextField.text {
            if billTextField.text != "" {
                let amountString = billTextField.text!
                amount = Float(amountString)!
                let calculation = (amount + (amount*tip)) / numberOfPeople
                totalPerPerson = calculation
                
                self.performSegue(withIdentifier: "goToResults", sender: self)
            }
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.amount = amount
            destinationVC.numberOfPeople = numberOfPeople
            destinationVC.tip = tip * 100
            destinationVC.totalPerPerson = totalPerPerson
        }
    }
    
}

