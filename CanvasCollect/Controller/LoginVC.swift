//
//  LoginVC.swift
//  CanvasCollect
//
//  Created by Tom Plucinski on 6/9/20.
//  Copyright © 2020 Tom Plucinski. All rights reserved.
//

import UIKit
import Firebase

class LoginVC: UIViewController {
    
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passText: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func forgotPassClicked(_ sender: Any) {
    }
    
    @IBAction func loginClicked(_ sender: Any) {
        
        guard let email = emailText.text, email.isNotEmpty,
            let password = passText.text, password.isNotEmpty else { return }
        
        activityIndicator.startAnimating()
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            
            if let error = error {
                debugPrint(error)
                self.activityIndicator.stopAnimating()
                return
            }
            
            self.activityIndicator.stopAnimating()
            print("Login was successful")
        }
    }
    
    @IBAction func guestClicked(_ sender: Any) {
    }
    
}
