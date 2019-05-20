//
//  LoginViewController.swift
//  NIBMConnect
//
//  Created by Supun Chathuranga on 5/20/19.
//  Copyright © 2019 Supun Lakmal. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import GoogleSignIn

class LoginViewController: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate{
    
    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var btnSignIn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
        }
    
    @IBAction func singnInfun(_ sender: Any) {
        Auth.auth().signIn(withEmail: self.userName.text!, password: self.password.text!) { [weak self] user, error in
            guard let strongSelf = self else { return }
            if error != nil {
                let alert = UIAlertController(title: "Login Error!", message: error?.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                strongSelf.present(alert, animated: true, completion: nil)
            } else {
                strongSelf.performSegue(withIdentifier: "showHome", sender: nil)
                AppData.storeData(data: user!.user.displayName, key: UserData.username)
            }
            
            // ...
        }
        
    }
    
    //Google Login
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
        // ...
        if let error = error {
            // ...
            print(error)
            return
        }
        
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                       accessToken: authentication.accessToken)
        // ...
        Auth.auth().signIn(with: credential) { (authResult, error) in
            if let error = error {
                // ...
                print(error)
                let alert = UIAlertController(title: "Login Error!", message: error.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                return
            }
            
            self.performSegue(withIdentifier: "showHome", sender: nil)
            
            print(authResult!.user.email!)
            print(authResult!.user.displayName as Any)
        }
        
    }
    
    }
