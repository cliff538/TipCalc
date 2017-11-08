//
//  Model.swift
//  TipCalc
//
//  Created by Cliff Gurske on 11/8/17.
//  Copyright © 2017 Cliff Gurske. All rights reserved.
//

import Foundation

//basic logic:
//take input ->
//calculate new values ->
//return as strings for labels.

//accept subtotal as String
//accept tipPercent as Int

//convert subtotal to NSDecimal for calculation
//convert tipPercent to NSDecimal for calculation

//calculate tipAmount
//calculate totalAmount

//convert subtotal to Currency
//convert tipAmount to Currency
//convert total to Currency


class Model {
	
	var subtotalFromTextField = "0.00"
	var tipPercentFromSlider = 15
	
	
	// MARK: - Decimals For Calculation
	var subtotalAsDecimal: NSDecimalNumber {
		return NSDecimalNumber(string: subtotalFromTextField)
	}
	
	var tipPercent: NSDecimalNumber {
		return NSDecimalNumber(value: Double(tipPercentFromSlider)/100)
	}
	
	//subtotal * tipPercent = tipAmount
	var tipAmount: NSDecimalNumber {
		return subtotalAsDecimal.multiplying(by: tipPercent)
	}
	
	var totalAmount: NSDecimalNumber {
		return subtotalAsDecimal.adding(tipAmount)
	}
	
	// MARK: - Convert to Currency
	let formatter = NumberFormatter()
	
	var subtotalAsCurrency: String {
		formatter.numberStyle = .currency
		return formatter.string(from: subtotalAsDecimal as NSNumber)!
	}
	
	var tipAmountAsCurrency: String {
		formatter.numberStyle = .currency
		return formatter.string(from: tipAmount as NSNumber)!
	}
	
	var totalAmountAsCurrency: String {
		formatter.numberStyle = .currency
		return formatter.string(from: totalAmount as NSNumber)!
	}
	
	


}
