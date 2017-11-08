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
		
		
	}
	
	// MARK: - Outlets
	@IBOutlet weak var subtotalTextField: UITextField!
	@IBOutlet weak var tipPercentLabel: UILabel!
	
	// MARK: - Interactions
	@IBAction func dragSlider(_ sender: UISlider) {
		//testing: print("\(Int(sender.value))")
		
		tipPercentLabel.text = "Tip (\(Int(sender.value))%):"
	}
	
	
	
	
	// MARK: - Functions
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
		
	}
	
	
	

	


}

