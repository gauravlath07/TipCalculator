//
//  File.swift
//  TipCalculator
//
//  Created by Gaurav Lath on 2015-12-30.
//  Copyright © 2015 Gaurav Lath. All rights reserved.
//

class TipCalculatorModel {
    
    var total: Double
    //total is the value before tax
    var taxPct: Double
    //tacPct is the value of tax charged by the restaurant
    var tipPct: Double
    //tipPct is the value of the tip you want to give

    var subtotal: Double
    {
        get {
                return total + (total * ((taxPct + tipPct)/100))
            
                /*
                We use "get" because the value of subtotal changes everytime
                so we put get so that the value is calculated on runtime 
                whenever we call it in the program later
                */
            }
        
    }
    
    init(total: Double, taxPct: Double, tipPct: Double) {
        self.total = total
        self.taxPct = taxPct
        self.tipPct = tipPct
    }
}

