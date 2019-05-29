//
//  Friends.swift
//  NIBMConnect
//
//  Created by Supun Chathuranga on 5/22/19.
//  Copyright © 2019 Supun Lakmal. All rights reserved.
//

import Foundation


class Friends {
    
    var id:String
    var Fname:String
    var Lname:String
    var FBLink:String
    var PNumber:String
    var Birth:String
    var PFPic:String
    var City:String
    
    init(id:String, fName:String, lName:String, fBLink:String, ph:String, bir:String, pf:String, city:String) {
        
        self.id  = id
        self.Fname = fName
        self.Lname = lName
        self.FBLink = fBLink
        self.PNumber = ph
        self.Birth = bir
        self.PFPic = pf
        self.City = city
    }
}
