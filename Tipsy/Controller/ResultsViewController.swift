//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Rodrigo Dominguez Burich on 2020-01-31.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    

    var tip:Float = 0
    var numberOfPeople: Float = 0
    var amount:Float = 0
    var totalPerPerson: Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = String(format: "%.2f", totalPerPerson)
        settingsLabel.text = "Split between \(Int(numberOfPeople)) people, with \(Int(tip))% tip"
    }
    
    
    
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
