//
//  HworkViewController.swift
//  NIBMConnect
//
//  Created by Supun Chathuranga on 5/28/19.
//  Copyright © 2019 Supun Lakmal. All rights reserved.
//

import UIKit

class HworkViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
   
    
    @IBOutlet weak var tableView: UITableView!
    var homeWorkArray:[HomeWork] = []
   

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        view.setGradientBackground(colorOne: colorTop, colorTwo: colorBottom)

        // Do any additional setup after loading the view.
//    }
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return itemArray.count
//    }
//     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell  = tableView.dequeueReusableCell(withIdentifier: "HomeWorkCell", for: indexPath)
//        cell.textLabel?.text = itemArray[indexPath.row]
//        return cell
//    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//       tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
//        tableView.deselectRow(at: indexPath, animated: true)
//    }
//    @IBAction func addWork(_ sender: UIBarButtonItem) {
//        let textField = UITextField()
//        let alert = UIAlertController(title: "Add new Work", message: "", preferredStyle: .alert)
//        let action = UIAlertAction(title: "Add work", style: .default) { (action) in
//            // when user click what happen
//            //print(textField.text)
//            
//            self.itemArray.append(textField.text!)
//            self.tableView.reloadData()
//        }
//        alert.addTextField{(alertTextField) in
//            alertTextField.placeholder = "Create Work"
//            textField.text = alertTextField.text
//            //print(alertTextField.text)
//            //print("NOW")    }
//        alert.addAction(action)
//        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func gotoAddhw(_ sender: Any) {
        
        self.performSegue(withIdentifier: "addhomework", sender: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        self.tableView.reloadData()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        if let arrayDetails = HomeWork.getHomeWork() {
            homeWorkArray = arrayDetails
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeWorkArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let homew = homeWorkArray[indexPath.row]
        
        let cell:HomeWorkCell = tableView.dequeueReusableCell(withIdentifier: "HomeWCell", for: indexPath) as! HomeWorkCell
        
        cell.setupCell(title: homew.title)
        
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            homeWorkArray.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
            self.tableView.reloadData()
        }
    }

}


