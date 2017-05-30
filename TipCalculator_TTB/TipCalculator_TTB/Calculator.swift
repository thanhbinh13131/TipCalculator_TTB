//
//  Calculator.swift
//  TipCalculator_TTB
//
//  Created by TTB on 5/30/17.
//  Copyright © 2017 TTB. All rights reserved.
//

import Foundation

class TipCalculator{
    var tipAmount: Float = 0
    var amountBeforeTax: Float = 0
    var tipPercentage: Float = 0
    var totalAmount: Float = 0
    
    init(amountBeforeTax: Float, tipPercentage: Float){
        self.amountBeforeTax = amountBeforeTax
        self.tipPercentage = tipPercentage
    }
    
    func calculateTip(){
        tipAmount = tipPercentage * amountBeforeTax
        totalAmount = amountBeforeTax + tipAmount
    }


}
