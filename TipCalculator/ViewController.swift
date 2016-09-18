//
//  ViewController.swift
//  TipCalculator
//
//  Created by Gaurav Lath on 2015-12-30.
//  Copyright © 2015 Gaurav Lath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    /*
    These are references for the buttons and all created in the
    storyboard.
    */
    
    /*
    You’re prefixing these variables with the @IBOutlet keyword.
    Interface Builder scans your code looking for any properties
    in your view controller prefixed with this keyword.
    It exposes any properties it discovers so you can connect
    them to views.
    
    Also the exclamation mark in after the names means the
    variables are optional values, but they are implicitly
    unwrapped. This is a fancy way of saying you can write
    code assuming that they are set, and your app will crash
    if they are not set.
    */

    @IBOutlet var totalTextField : UITextField!
    @IBOutlet var taxPctSlider : UISlider!
    @IBOutlet var taxPctLabel : UILabel!
    @IBOutlet var resultsTextView : UITextView!
    @IBOutlet var tipPct: UISlider!
    @IBOutlet var tipPctLabel: UILabel!
    @IBOutlet var calculateButton: UIButton!
    
    
    /*
    To make Interface Builder notice your new methods, 
    you need to mark these methods with the @IBAction 
    keyword (just as you marked properties with the @IBOutlet keyword).
    */

    
    
    
   @IBAction func calculateTapped(sender : AnyObject) {
        
        tipCalc.total = Double((totalTextField.text! as NSString).doubleValue)
        // the text is of type string. It is typecasted to the form NSString so that
        // it can be converted to a double type.
        
        tipCalc.taxPct = Double(taxPctSlider.value)
        tipCalc.tipPct = Double(tipPct.value)
        
        print(tipCalc.subtotal)
        
        refreshUIFinal()
       }
    
    @IBAction func taxPercentageChanged(sender : AnyObject) {
        tipCalc.taxPct = Double(taxPctSlider.value)
        refreshUIInitial()
    }
    
    @IBAction func tipPercentage(sender: AnyObject) {
        tipCalc.tipPct = Double(tipPct.value)
        refreshUIInitial()
    }
    
    @IBAction func viewTapped(sender : AnyObject) {
        totalTextField.resignFirstResponder()
    }
    
    let tipCalc = TipCalculatorModel(total: 500, taxPct: 15, tipPct: 15)
    
    func refreshUIInitial(){
        taxPctLabel.text = "Tax Percentage (\(Int(taxPctSlider.value))%)"
        tipPctLabel.text = "Tip Percentage (\(Int(tipPct.value))%)"
    }
    
    func refreshUIFinal() {
        
            let alertController = UIAlertController(title: "Result", message: String(format: "%0.2f", tipCalc.subtotal), preferredStyle: .Alert)
            let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        
            alertController.addAction(defaultAction)
            presentViewController(alertController, animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.darkGrayColor()
        
        taxPctSlider.minimumTrackTintColor = UIColor.yellowColor()
        taxPctSlider.setThumbImage(UIImage(named: "triangle")!, forState: .Normal)
        
        tipPct.minimumTrackTintColor = UIColor.yellowColor()
        tipPct.setThumbImage(UIImage(named: "triangle")!, forState: .Normal)
        
//      refreshUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

