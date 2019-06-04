//
//  Homework.swift
//  NIBMConnect
//
//  Created by Supun Chathuranga on 6/2/19.
//  Copyright © 2019 Supun Lakmal. All rights reserved.
//

import Foundation
import UIKit

class HomeWork: Codable {
    
    var title:String
    
    
    init(addtitle:String) {
        self.title = addtitle
       
    }
    
    
    public static func getHomeWork() -> [HomeWork]? {
        
        var homeWorkArray:[HomeWork] = []
        if let homeWorkData = UserDefaults.standard.data(forKey: "homeworkData"){
            homeWorkArray = try! JSONDecoder().decode([HomeWork].self, from: homeWorkData)
        }
        return homeWorkArray
    }
    
    public static func reSave(homeWorks:[HomeWork]){
        let homeWorkDat = try! JSONEncoder().encode(homeWorks)
        UserDefaults.standard.set(homeWorkDat, forKey: "homeworkData")
    }
    
    
    public static func saveHomeWork(homeWork:HomeWork){
        var retrivedHomeWorkArray:[HomeWork] = []
        
        if  let homeWorkData = UserDefaults.standard.data(forKey: "homeworkData"){
            retrivedHomeWorkArray = try! JSONDecoder().decode([HomeWork].self, from: homeWorkData)
        }
        
        
        if retrivedHomeWorkArray.count == 0 {
            
            var homeWorkArray = [HomeWork]()
            homeWorkArray.append(homeWork)
            let homeWorkDat = try! JSONEncoder().encode(homeWorkArray)
            UserDefaults.standard.set(homeWorkDat, forKey: "homeworkData")
        }else{
            
            retrivedHomeWorkArray.append(homeWork)
            let homeWorkDat = try! JSONEncoder().encode(retrivedHomeWorkArray)
            UserDefaults.standard.set(homeWorkDat, forKey: "homeworkData")
            
        }
        
        
    }
}
