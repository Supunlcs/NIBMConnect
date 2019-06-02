//
//  StudentViewController.swift
//  NIBMConnect
//
//  Created by Supun Chathuranga on 5/26/19.
//  Copyright © 2019 Supun Lakmal. All rights reserved.
//

import UIKit
import Kingfisher

class StudentDViewController: UIViewController {
    
    

    
    @IBOutlet weak var proImg: UIImageView!
    @IBOutlet weak var Fname: UILabel!
    @IBOutlet weak var FBLink: UILabel!
    @IBOutlet weak var Lname: UILabel!
    @IBOutlet weak var PNumber: UILabel!
    @IBOutlet weak var Birth: UILabel!
    @IBOutlet weak var City: UILabel!
    
    var passFriend: Friends! = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setGradientBackground(colorOne: colorTop, colorTwo: colorBottom)
        proImg.layer.borderWidth=1.0
        proImg.layer.masksToBounds = false
        proImg.layer.borderColor = UIColor.white.cgColor
        proImg.layer.cornerRadius = proImg.frame.size.width/2
        proImg.clipsToBounds = true
        // Do any additional setup after loading the view.
        //print(passFriend?.firstName)
        
        
        Fname.text = passFriend.Fname
        Lname.text = passFriend.Lname
        PNumber.text = passFriend.PNumber
        City.text = passFriend.City
        Birth.text = passFriend.Birth
        FBLink.text = passFriend.FBLink
        let url = URL(string: passFriend!.PFPic)
        proImg.kf.setImage(with: url)
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
