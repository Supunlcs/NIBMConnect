//
//  HomeViewController.swift
//  NIBMConnect
//
//  Created by Supun Chathuranga on 5/19/19.
//  Copyright © 2019 Supun Lakmal. All rights reserved.
//

import UIKit
import LocalAuthentication

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func goToProfile(_ sender: Any) {
        let myContext:LAContext = LAContext()
        let myLocalizedReasonString = "NIBM Connect"
        
        var authError: NSError?
        if #available(iOS 8.0, macOS 10.12.1, *) {
            if myContext.canEvaluatePolicy(.deviceOwnerAuthentication, error: nil) {
                myContext.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason:myLocalizedReasonString) { success, evaluateError in
                    
                    
                        if success {
                            // User authenticated successfully, take appropriate action
                            print("connect")
                            DispatchQueue.main.async {self.performSegue(withIdentifier: "showProfile", sender: self)}
                            
                        } else {
                            print("incorrect")
                            let error = evaluateError?.localizedDescription
                            print(error as Any)
                        }
                    
                }
            } else {
                print("Sorry!!.. Could not evaluate policy.")
            }
        } else {
            print("Sorry!!.. Could not evaluate policy.")
        }
        
        
    }
    
    @IBAction func friendView(_ sender: Any) {
        
         self.performSegue(withIdentifier: "showFriends", sender: self)
    }
    
    @IBAction func homeWork(_ sender: Any) {
        self.performSegue(withIdentifier: "showHwork", sender: self)
        
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
