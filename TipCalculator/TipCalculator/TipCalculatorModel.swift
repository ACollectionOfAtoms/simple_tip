//
//  TipCalculatorModel.swift
//  TipCalculator
//
//  Created by Adam Hernandez on 11/27/15.
//  Copyright © 2015 Adam. All rights reserved.
//

import Foundation

class TipCalculatorModel {
    
    var total: Double
    var taxPct: Double
    var subtotal: Double {
        get {
            return total / (taxPct + 1)
        }
    }
    
    init(total: Double, taxPct: Double) {
        self.total = total
        self.taxPct = taxPct
    }
    
    func calcTipWithTipPct(tipPct: Double) -> (tipAmt: Double, total: Double) {
        let tipAmt = subtotal * tipPct
        let finalTotal = total + tipAmt
        return (tipAmt, finalTotal)
    }
    
    let possibleTipsInferred = [0.15, 0.18, 0.20]
    
    func returnPossibleTips() -> [Int: (tipAmt: Double, total: Double)] {
        
        let possibleTipsInferred = [0.15, 0.18, 0.20]
        
        var retval = [Int: (tipAmt: Double, total: Double)]() //Empty Dictionary
        for possibleTip in possibleTipsInferred {
            let intPct = Int(possibleTip*100)
            retval[intPct] = calcTipWithTipPct(possibleTip)
        }
        return retval
    }
}


