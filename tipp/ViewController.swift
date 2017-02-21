//  ViewController.swift
//  tipp
//
//  Created by Karen Ng on 2/13/17.
//  Copyright © 2017 Karen Ng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!

    @IBOutlet weak var billName: UILabel!
    @IBOutlet weak var tipName: UILabel!
    @IBOutlet weak var totalName: UILabel!
    @IBOutlet weak var dollarSign: UILabel!
    
    // Do any additional setup after loading the view, typically from a nib.
    override func viewDidLoad() {
        super.viewDidLoad()

        self.billField.becomeFirstResponder()
        
        self.billField.font = UIFont(name: "Futura", size: 32)
        self.dollarSign.font = UIFont(name: "Futura", size: 32)
        self.billName.font = UIFont(name: "Futura", size: 12)
        self.totalLabel.font = UIFont(name: "Futura", size: 32)
        self.totalName.font = UIFont(name: "Futura", size: 12)
        self.tipLabel.font = UIFont(name: "Futura", size: 32)
        self.tipName.font = UIFont(name: "Futura", size: 12)
        
        self.tipName.alpha = 0
        self.tipLabel.alpha = 0
        self.totalName.alpha = 0
        self.totalLabel.alpha = 0
        self.tipControl.alpha = 0
    }

    // Dispose of any resources that can be recreated.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    //tap anywhere outside Bill textfield and it minimizes keypad
    @IBAction func onTap(_ sender: AnyObject) {
        view.endEditing(true)
    }

    @IBAction func calculateTip(_ sender: AnyObject) {
        
        
        let tipPercentages = [0.18, 0.20, 0.25]
        let bill = Double(billField.text!) ?? 0 //take string in billField.text and change into a number and if someone pastes something that's a nil (not a valid #), return 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        UIView.animate(withDuration: 0.5, animations: {
            
        self.tipName.alpha = 1
        self.tipLabel.alpha = 1
        self.totalName.alpha = 1
        self.totalLabel.alpha = 1
        self.tipControl.alpha = 1
            
        self.billName.alpha = 0.4
        self.billField.alpha = 0.4
        self.dollarSign.alpha = 0.4
        }
        )
 
    }
    
}

