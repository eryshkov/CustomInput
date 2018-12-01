//
//  ViewController.swift
//  CustomInput
//
//  Created by Evgeniy Ryshkov on 01/12/2018.
//  Copyright © 2018 Evgeniy Ryshkov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    var selectedElement: String?
    var uiElements = [
                    "UISegmentedControl",
                    "UILabel",
                    "UISlider",
                    "UITextField",
                    "UIButton",
                    "UIDatePicker",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectUIElement()
        createToolBar()
    }

    func selectUIElement() {
        let elementPicker = UIPickerView()
        elementPicker.delegate = self
        elementPicker.dataSource = self
        
        //Custom input view to display when the text field becomes the first responder.
        textField.inputView = elementPicker
    }
    
    func createToolBar() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(dismissKeyboard))
        
        toolBar.setItems([doneButton], animated: true)
        toolBar.isUserInteractionEnabled = true
        
        //The custom accessory view to display when the text field becomes the first responder
        textField.inputAccessoryView = toolBar
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return uiElements.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return uiElements[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedElement = uiElements[row]
        textField.text = uiElements[row]
    }
    
}
