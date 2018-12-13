//
//  RegisterViewController.swift
//  SecurityEvalApp
//
//  Created by Kyle Matthews & Joy Tan on 11/28/18.
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
        NSLog("Unme to be passed: " + RI_username.text!)
        NSLog("Pwd to be passed: " + RI_password.text!)
        NSLog("PwdVer to be passed: " + RI_verpwd.text!)
        
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
//                writeCredentials(rcUn: RI_username.text!, rcPwd: RI_password.text!)
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
    //------------------  End of Registration Button Function ------------------------//
    //TODO: EVERYTHING
//    func writeCredentials(rcUn: String, rcPwd: String)
//    {
//        NSLog("Write Un: " + rcUn + "&& Write Pwd: " + rcPwd)
//        let ucFile = "UserCredentials.txt"
//        let contents = rcUn + "," + rcPwd
//        let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//
//        do
//        {
//            try contents.writeToFile(/Users/matthewsk/Documents/Code/XCode\ Stuff/SecurityEvalApp/SecurityEvalApp/SecurityEvalApp/, atomically: false, encoding: NSUTF8StringEncoding)
//        }
//        catch let error as NSError
//        {
//            print("Ooops! Something went wrong: \(error)")
//        }
//
//
//     Passing user credentials to be saved
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let rc = segue.destination as? RegisterViewController
//        {
//            rc.RI_username = RI_username
//            rc.RI_password = RI_password
//            NSLog("un credentials passed: " + rc.RI_username.text!)
//            NSLog("pwd credentials passed: " + rc.RI_username.text!)
//
//        }
//    }

    //------------------- Passing user credentials end ----------------------//
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Functions to hide keyboard //
        self.RI_username.delegate = self
        self.RI_password.delegate = self
        self.RI_verpwd.delegate = self
    }
    
    // Functions to hide keyboard //
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    // Functions to hide keyboard //
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
