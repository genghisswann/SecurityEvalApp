//
//  SignInViewController.swift
//  SecurityEvalApp
//
//  Created by Kyle Matthews on 12/5/18.
//  Copyright © 2018 Swann. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, UITextFieldDelegate {

    // Users Sign In credentials
    @IBOutlet weak var SI_username: UITextField!
    @IBOutlet weak var SI_password: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.SI_username.delegate = self
        self.SI_password.delegate = self
    }
    
    // Hide keyboard when user touches out of keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // Hide keyboard when user hits return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        SI_username.resignFirstResponder()
        SI_password.resignFirstResponder()
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
