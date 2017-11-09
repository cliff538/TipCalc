//
//  ViewController.swift
//  TipCalc
//
//  Created by Cliff Gurske on 11/8/17.
//  Copyright © 2017 Cliff Gurske. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	// MARK: - View Did Load
	override func viewDidLoad() {
		super.viewDidLoad()
		subtotalTextField.becomeFirstResponder() //brings up keyboard on app launch
		createToolbar()
		
		
	}// MARK: - Outlets
	@IBOutlet weak var subtotalTextField: UITextField!
	@IBOutlet weak var tipPercentLabel: UILabel!
	@IBOutlet weak var tipPercentSlider: UISlider!
	@IBOutlet weak var tipAmountLabel: UILabel!
	@IBOutlet weak var totalAmountLabel: UILabel!
	
	// MARK: - Properties
	let model = Model()
	
	
	
	// MARK: - Interactions
	@IBAction func dragSlider(_ sender: UISlider) {
		//testing: print("\(Int(sender.value))")
		
		tipPercentLabel.text = "Tip (\(Int(sender.value))%):"
		
		model.tipPercentFromSlider = Int(sender.value)
		updateLabels()
	}
	
	
	
	
	// MARK: - Functions
	
	//creating a toolbar that sits above keyboard 
	func createToolbar() {
		let toolbar = UIToolbar()
		toolbar.barStyle = .default
		toolbar.sizeToFit()
		
		//create barButtonItems
		let doneButton = UIBarButtonItem(
		                 barButtonSystemItem: .done,
						         target: self,
										 action: #selector(dismissKeyboard))
		
		let flexibleSpace = UIBarButtonItem(
			                  barButtonSystemItem: .flexibleSpace,
												target: self,
												action: nil)
		
		//add items to toolbar
		toolbar.setItems([flexibleSpace, doneButton], animated: true)
		
		//add toolbar to keyboard
		subtotalTextField.inputAccessoryView = toolbar
	}
	
	@objc func dismissKeyboard() {
		subtotalTextField.resignFirstResponder() //removes keyboard
		
		if subtotalTextField.text?.characters.count == 0 {
			subtotalTextField.text = "$0.00"
			model.subtotalFromTextField = "0.00"
			updateLabels()
		} else {
			model.subtotalFromTextField = subtotalTextField.text!
			model.tipPercentFromSlider = Int(tipPercentSlider.value)
			
			updateLabels()
		}
		
	}
	
	func updateLabels() {
		subtotalTextField.text = model.subtotalAsCurrency
		tipAmountLabel.text = model.tipAmountAsCurrency
		totalAmountLabel.text = model.totalAmountAsCurrency
	}
}

