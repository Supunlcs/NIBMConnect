//
//  MyProfileViewController.swift
//  NIBMConnect
//
//  Created by Supun Chathuranga on 5/20/19.
//  Copyright © 2019 Supun Lakmal. All rights reserved.
//

import UIKit
import LocalAuthentication

class MyProfileViewController: UIViewController {

    @IBOutlet weak var myProPic: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setGradientBackground(colorOne: colorTop, colorTwo: colorBottom)
        // Do any additional setup after loading the view.
        
        myProPic.layer.borderWidth=1.0
        myProPic.layer.masksToBounds = false
        myProPic.layer.borderColor = UIColor.white.cgColor
        myProPic.layer.cornerRadius = myProPic.frame.size.height/2
        myProPic.clipsToBounds = true
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
