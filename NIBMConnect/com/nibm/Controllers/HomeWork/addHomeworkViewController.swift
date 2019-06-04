//
//  addHomeworkViewController.swift
//  NIBMConnect
//
//  Created by Supun Chathuranga on 6/2/19.
//  Copyright © 2019 Supun Lakmal. All rights reserved.
//

import UIKit

class addHomeworkViewController: UIViewController {

    @IBOutlet weak var addHomeworktxt: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setGradientBackground(colorOne: colorTop, colorTwo: colorBottom)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addHomeWork(_ sender: Any) {
        let newHomeWork = HomeWork(addtitle:addHomeworktxt.text!)
        HomeWork.saveHomeWork(homeWork: newHomeWork)
        //HworkViewController.self
        
        
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
