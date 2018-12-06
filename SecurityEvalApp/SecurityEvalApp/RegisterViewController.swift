//
//  RegisterViewController.swift
//  SecurityEvalApp
//
//  Created by Kyle Matthews on 12/5/18.
//  Copyright © 2018 Swann. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate {
    
    // Username, password, and password verification fields.
    
    @IBOutlet weak var RI_username: UITextField!
    @IBOutlet weak var RI_password: UITextField!
    @IBOutlet weak var RI_verpwd: UITextField!
    
    // Passing values of user credentials to save
    @IBAction func registerButton(_ sender: Any) {
        NSLog(RI_username.text!)
        NSLog(RI_password.text!)
        NSLog(RI_verpwd.text!)
        
        // Checks if fields are filled in correctly
        if RI_username.text!.isEmpty || RI_password.text!.isEmpty || RI_verpwd.text!.isEmpty
        {
            NSLog("Empty fields are present.")
            let fieldAlert = UIAlertController(title: "Text fields are left blank", message: "Please fill in all fields.", preferredStyle: .alert)
            
            fieldAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(fieldAlert, animated: true)
            
        }
        else
        {
            if RI_password.text == RI_verpwd.text
            {
                NSLog("Passwords match.")
                
                performSegue(withIdentifier: "registerSegue", sender: self)
            }
            else
            {
                NSLog("Passwords do NOT match.")
                let passwordAlert = UIAlertController(title: "Passwords do not match", message: "Please retype your password.", preferredStyle: .alert)
            
                passwordAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(passwordAlert, animated: true)
            }
        }
    }
    
    
    //override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //let
    //}

    //------------------------------------------//
    
    
    
    // Functions to hide keyboard //
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.RI_username.delegate = self
        self.RI_password.delegate = self
        self.RI_verpwd.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        RI_username.resignFirstResponder()
        RI_password.resignFirstResponder()
        RI_verpwd.resignFirstResponder()
        return (true)
    }
    //------------------------------------------//
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
