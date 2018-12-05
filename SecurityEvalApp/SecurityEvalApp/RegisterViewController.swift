//
//  RegisterViewController.swift
//  SecurityEvalApp
//
//  Created by Kyle Matthews on 12/5/18.
//  Copyright © 2018 Swann. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var RI_username: UITextField!
    @IBOutlet weak var RI_password: UITextField!
    @IBOutlet weak var RI_verpwd: UITextField!
    
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
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
