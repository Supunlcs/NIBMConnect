//
//  ForgetPasswordViewController.swift
//  NIBMConnect
//
//  Created by Supun Chathuranga on 5/20/19.
//  Copyright © 2019 Supun Lakmal. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase


class ForgetPasswordViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var forgetpass: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setGradientBackground(colorOne: colorTop, colorTwo: colorBottom)
        // Do any additional setup after loading the view.
        self.forgetpass.backgroundColor = UIColor.black
        self.forgetpass.layer.cornerRadius = 15;
    }
    

    @IBAction func dismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func forgetPass(_ sender: Any) {
        
        if email.text!.isEmpty {
            print("please enter a email")
            return
        }else {
            
            Auth.auth().sendPasswordReset(withEmail: email.text!) { (error) in
                if (error != nil){
                    print(error?.localizedDescription)
                    
                }else{
                    self.dismiss(animated: true, completion: nil)
                }
            }
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
}
