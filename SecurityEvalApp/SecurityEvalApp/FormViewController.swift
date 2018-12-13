//
//  FormViewController.swift
//  SecurityEvalApp
//
//  Created by Kyle Matthews on 12/11/18.
//  Copyright © 2018 Swann. All rights reserved.
//

import UIKit

class FormViewController: UIViewController{
    // ALL TEXT FIELDS (OUTLETS)
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var schoolDistrictTextField: UITextField!
    @IBOutlet weak var schoolNameTextField: UITextField!
    @IBOutlet weak var buildingTextField: UITextField!
    @IBOutlet weak var roomNumberTextField: UITextField!
    @IBOutlet weak var roomTypeTextField: UITextField!
    @IBOutlet weak var entryTypeTextField: UITextField!
    @IBOutlet weak var swingTextField: UITextField!
    @IBOutlet weak var doorMaterialTextField: UITextField!
    @IBOutlet weak var doorConditionTextField: UITextField!
    @IBOutlet weak var doorFrameTextField: UITextField!
    @IBOutlet weak var frameConditionTextField: UITextField!
    @IBOutlet weak var outdoorLockTextField: UITextField!
    @IBOutlet weak var outdoorHardwareTextField: UITextField!
    @IBOutlet weak var lockConditionTextField: UITextField!
    @IBOutlet weak var insideDoorLockTextField: UITextField!
    @IBOutlet weak var insideDoorHardwareTextField: UITextField!
    
    
    // ALL UIPICKER OPTIONS
    let schoolDistrictOptions = [nil,"Humboldt Unified School District", "Prescott Unified School District", "Yavapai County Accomodational School", "Chino Valley School District"]
    let schoolNameOptions = [nil,"Bradshaw Mountain High School", "Bradshaw Mountain Middle School", "Lakeview Elementary School", "Liberty Traditional School", "Granville Elementary School", "Glassford Hill Middle School", "District Offices", "Lake Valley Elementary", "Granite Mountain Middle School", "Taylor Hichs Elementary School", "Lincolin Elementary School", "Mile High Middle School", "Prescott High School"]
    let roomTypeOptions = [nil, "Classroom", "Administrative Offices", "Hallway", "Gym", "Cefeteria", "Auditorium", "Library", "Common Area"]
    // SUBJECT TO CHANGE TO MULTI PICKER VIEW
    let entryTypeOptions = [nil, "Interior - Single", "Interior - Double", "Interior - Roll Up", "Exterior - Single", "Exterior - Double", "Exterior - Roll Up"]
    let swingTypeOptions = [nil, "In - Left", "In - Right", "Out - Left", "Out - Right", "In - Left & Right", "Out - Left & Right", "Rolls - Up & Down"]
    let doorMaterialsOptions = [nil, "Wood - Solid Core", "Wood - Hollow Core", "Wood - Panel", "Steel - Solid Core", "Steel - Hollow Core", "Fiberglass - Solid Core", "Fiberglass - Hollow", "Glass"]
    let conditionOptions = [nil, "Good", "Moderate", "Warped", "Broken"]
    let doorFrameOptions = [nil, "Wood", "Steel"]
    let outdoorLockOptions = [nil, "Yes - Key", "Yes - Keypad", "Yes - Card Reader", "Yes - Hex Key", "No"]
    let outdoorHardwareOptions = [nil, "Lever", "Knob", "Grip Pull w/ Thumb", "Pull Handle", "Push Plate", "Key Only"]
    let insideDoorLockOptions = [nil, "Yes - Key", "Yes - Thumb Screw", "Yes - Thumb Lever", "Yes - Button", "Yes - Hex Key", "Yes - Key Lock"]
    let insideDoorHardwareOptions = [nil, "Lever", "Knob", "Panic Bar", "Side Latch", "Pull Handle", "Dual Cylinder Deadbolt"]
    //Frame Condition & Outdoor Lock Condition is represented by conditionOptions
    
    
    var itemSelected = UITextField()
    var optionSelected = [""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing(_:))))
        
        // NUMBERPAD FIELDS
        idTextField.keyboardType = UIKeyboardType.numberPad
        roomNumberTextField.keyboardType = UIKeyboardType.numberPad
        
        setupUI()
    }
    
    
    // UIPICKER TYPES
    // PICKER TYPE SINGULAR
    var pickerView: UIPickerView {
        get {
            let pickerView = UIPickerView()
            pickerView.dataSource = self
            pickerView.delegate = self
            pickerView.backgroundColor = UIColor.white
            return pickerView
        }
    }
    
    var accessoryToolbar: UIToolbar {
        get {
            let toolbarFrame = CGRect(x: 0, y: 0,
                                      width: view.frame.width, height: 44)
            let accessoryToolbar = UIToolbar(frame: toolbarFrame)
            let doneButton = UIBarButtonItem(barButtonSystemItem: .done,
                                             target: self,
                                             action: #selector(onDoneButtonTapped(sender:)))
            let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                                target: nil,
                                                action: nil)
            accessoryToolbar.items = [flexibleSpace, doneButton]
            accessoryToolbar.barTintColor = UIColor.white
            return accessoryToolbar
        }
        
    }
    
    // SETS UP ALL FIELDS NECESSARY
    func setupUI() {
        schoolDistrictTextField.inputView = pickerView
        schoolDistrictTextField.inputAccessoryView = accessoryToolbar
        schoolDistrictTextField.text = schoolDistrictOptions[0]
        
        schoolNameTextField.inputView = pickerView
        schoolNameTextField.inputAccessoryView = accessoryToolbar
        schoolNameTextField.text = schoolNameOptions[0]
        
        roomTypeTextField.inputView = pickerView
        roomTypeTextField.inputAccessoryView = accessoryToolbar
        roomTypeTextField.text = roomTypeOptions[0]
        
        entryTypeTextField.inputView = pickerView
        entryTypeTextField.inputAccessoryView = accessoryToolbar
        entryTypeTextField.text = entryTypeOptions[0]
        
        swingTextField.inputView = pickerView
        swingTextField.inputAccessoryView = accessoryToolbar
        swingTextField.text = swingTypeOptions[0]
        
        doorMaterialTextField.inputView = pickerView
        doorMaterialTextField.inputAccessoryView = accessoryToolbar
        doorMaterialTextField.text = doorMaterialsOptions[0]
        
        doorConditionTextField.inputView = pickerView
        doorConditionTextField.inputAccessoryView = accessoryToolbar
        doorConditionTextField.text = conditionOptions[0]

        doorFrameTextField.inputView = pickerView
        doorFrameTextField.inputAccessoryView = accessoryToolbar
        doorFrameTextField.text = doorFrameOptions[0]

        frameConditionTextField.inputView = pickerView
        frameConditionTextField.inputAccessoryView = accessoryToolbar
        frameConditionTextField.text = conditionOptions[0]
        
        outdoorLockTextField.inputView = pickerView
        outdoorLockTextField.inputAccessoryView = accessoryToolbar
        outdoorLockTextField.text = outdoorLockOptions[0]

        outdoorHardwareTextField.inputView = pickerView
        outdoorHardwareTextField.inputAccessoryView = accessoryToolbar
        outdoorHardwareTextField.text = outdoorHardwareOptions[0]

        lockConditionTextField.inputView = pickerView
        lockConditionTextField.inputAccessoryView = accessoryToolbar
        lockConditionTextField.text = conditionOptions[0]

        insideDoorLockTextField.inputView = pickerView
        insideDoorLockTextField.inputAccessoryView = accessoryToolbar
        insideDoorLockTextField.text = insideDoorLockOptions[0]

        insideDoorHardwareTextField.inputView = pickerView
        insideDoorHardwareTextField.inputAccessoryView = accessoryToolbar
        insideDoorHardwareTextField.text = insideDoorHardwareOptions[0]

    }
    
    // HIDES KEYBOARD / SELECTER VIEW WHEN DONE IS HIT OR TAPPED OUTSIDE OF AREA
    @objc func onDoneButtonTapped(sender: UIBarButtonItem) {
        if schoolDistrictTextField.isFirstResponder {
            schoolDistrictTextField.resignFirstResponder()
        }
        else if schoolNameTextField.isFirstResponder {
            schoolNameTextField.resignFirstResponder()
        }
        if roomTypeTextField.isFirstResponder {
            roomTypeTextField.resignFirstResponder()
        }
        if entryTypeTextField.isFirstResponder {
            entryTypeTextField.resignFirstResponder()
        }
        if swingTextField.isFirstResponder {
            swingTextField.resignFirstResponder()
        }
        if doorMaterialTextField.isFirstResponder {
            doorMaterialTextField.resignFirstResponder()
        }
        if doorConditionTextField.isFirstResponder {
            doorConditionTextField.resignFirstResponder()
        }
        if doorFrameTextField.isFirstResponder {
            doorFrameTextField.resignFirstResponder()
        }
        if frameConditionTextField.isFirstResponder {
            frameConditionTextField.resignFirstResponder()
        }
        if outdoorLockTextField.isFirstResponder {
            outdoorLockTextField.resignFirstResponder()
        }
        if outdoorHardwareTextField.isFirstResponder {
            outdoorHardwareTextField.resignFirstResponder()
        }
        if lockConditionTextField.isFirstResponder {
            lockConditionTextField.resignFirstResponder()
        }
        if insideDoorLockTextField.isFirstResponder {
            insideDoorLockTextField.resignFirstResponder()
        }
        if insideDoorHardwareTextField.isFirstResponder {
            insideDoorHardwareTextField.resignFirstResponder()
        }
    }
    
    // UIPICKER TYPES
    // PICKER TYPE MULTIPLE
    var multiPickerView: UIPickerView {
        get {
            let multiPickerView = UIPickerView()
            // TODO: Setup multi pickerView
            return multiPickerView
        }
    }
    
}

// START OF EXTENSIONS
// STUFF FOR SINGULAR PICKER
extension FormViewController: UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // DICTATES NUMBER OF ROWS IN CONPONENT BASED OFF WHICH VIEW IS PICKED
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if schoolDistrictTextField.isFirstResponder{
            return schoolDistrictOptions.count
        }
        else if schoolNameTextField.isFirstResponder{
            return schoolNameOptions.count
        }
        else if roomTypeTextField.isFirstResponder{
            return roomTypeOptions.count
        }
        else if entryTypeTextField.isFirstResponder{
            return entryTypeOptions.count
        }
        else if swingTextField.isFirstResponder{
            return swingTypeOptions.count
        }
        else if doorMaterialTextField.isFirstResponder{
            return doorMaterialsOptions.count
        }
        else if doorConditionTextField.isFirstResponder{
            return conditionOptions.count
        }
        else if doorFrameTextField.isFirstResponder{
            return doorFrameOptions.count
        }
        else if frameConditionTextField.isFirstResponder{
            return conditionOptions.count
        }
        else if outdoorLockTextField.isFirstResponder{
            return outdoorLockOptions.count
        }
        else if outdoorHardwareTextField.isFirstResponder{
            return outdoorHardwareOptions.count
        }
        else if lockConditionTextField.isFirstResponder{
            return conditionOptions.count
        }
        else if insideDoorLockTextField.isFirstResponder{
            return insideDoorLockOptions.count
        }
        else if insideDoorHardwareTextField.isFirstResponder{
            return insideDoorHardwareOptions.count
        }
        return 0
    }
}


extension FormViewController: UIPickerViewDelegate{
    // TITLE FOR ROW
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if schoolDistrictTextField.isFirstResponder{
            return schoolDistrictOptions[row]
        }
        else if schoolNameTextField.isFirstResponder{
            return schoolNameOptions[row]
        }
        else if roomTypeTextField.isFirstResponder{
            return roomTypeOptions[row]
        }
        else if entryTypeTextField.isFirstResponder{
            return entryTypeOptions[row]
        }
        else if swingTextField.isFirstResponder{
            return swingTypeOptions[row]
        }
        else if doorMaterialTextField.isFirstResponder{
            return doorMaterialsOptions[row]
        }
        else if doorConditionTextField.isFirstResponder{
            return conditionOptions[row]
        }
        else if doorFrameTextField.isFirstResponder{
            return doorFrameOptions[row]
        }
        else if frameConditionTextField.isFirstResponder{
            return conditionOptions[row]
        }
        else if outdoorLockTextField.isFirstResponder{
            return outdoorLockOptions[row]
        }
        else if outdoorHardwareTextField.isFirstResponder{
            return outdoorHardwareOptions[row]
        }
        else if lockConditionTextField.isFirstResponder{
            return conditionOptions[row]
        }
        else if insideDoorLockTextField.isFirstResponder{
            return insideDoorLockOptions[row]
        }
        else if insideDoorHardwareTextField.isFirstResponder{
            return insideDoorHardwareOptions[row]
        }
        return nil
    }
    
    
    // DID SELECT ROW
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if schoolDistrictTextField.isFirstResponder{
            let itemSelected = schoolDistrictOptions[row]
            schoolDistrictTextField.text = itemSelected
        }
        else if schoolNameTextField.isFirstResponder{
            let itemSelected = schoolNameOptions[row]
            schoolNameTextField.text = itemSelected
        }
        else if roomTypeTextField.isFirstResponder{
            let itemSelected = roomTypeOptions[row]
            roomTypeTextField.text = itemSelected
        }
        else if entryTypeTextField.isFirstResponder{
            let itemSelected = entryTypeOptions[row]
            entryTypeTextField.text = itemSelected
        }
        else if swingTextField.isFirstResponder{
            let itemSelected = swingTypeOptions[row]
            swingTextField.text = itemSelected
        }
        else if doorMaterialTextField.isFirstResponder{
            let itemSelected = doorMaterialsOptions[row]
            doorMaterialTextField.text = itemSelected
        }
        else if doorConditionTextField.isFirstResponder{
            let itemSelected = conditionOptions[row]
            doorConditionTextField.text = itemSelected
        }
        else if doorFrameTextField.isFirstResponder{
            let itemSelected = doorFrameOptions[row]
            doorFrameTextField.text = itemSelected
        }
        else if frameConditionTextField.isFirstResponder{
            let itemSelected = conditionOptions[row]
            frameConditionTextField.text = itemSelected
        }
        else if outdoorLockTextField.isFirstResponder{
            let itemSelected = outdoorLockOptions[row]
            outdoorLockTextField.text = itemSelected
        }
        else if outdoorHardwareTextField.isFirstResponder{
            let itemSelected = outdoorHardwareOptions[row]
            outdoorHardwareTextField.text = itemSelected
        }
        else if lockConditionTextField.isFirstResponder{
            let itemSelected = conditionOptions[row]
            lockConditionTextField.text = itemSelected
        }
        else if insideDoorLockTextField.isFirstResponder{
            let itemSelected = insideDoorLockOptions[row]
            insideDoorLockTextField.text = itemSelected
        }
        else if insideDoorHardwareTextField.isFirstResponder{
            let itemSelected = insideDoorHardwareOptions[row]
            insideDoorHardwareTextField.text = itemSelected
        }
    }
}
