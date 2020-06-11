//
//  RegisterVC.swift
//  CanvasCollect
//
//  Created by Tom Plucinski on 6/9/20.
//  Copyright © 2020 Tom Plucinski. All rights reserved.
//

import UIKit
import Firebase

class RegisterVC: UIViewController {
    
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var confirmPassText: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var passCheckImg: UIImageView!
    @IBOutlet weak var confirmPassCheckImg: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func registerClicked(_ sender: Any) {
        guard let email = emailText.text, email.isNotEmpty,
            let username = usernameText.text, username.isNotEmpty,
            let password = passwordText.text, password.isNotEmpty else { return }

        activityIndicator.startAnimating()

        Auth.auth().createUser(withEmail: email, password: password) { (authResult, error) in

            if let error = error {
                debugPrint(error)
                return
            }

            self.activityIndicator.stopAnimating()
            print("successfully registered new user.")
        }
    }
    
}
