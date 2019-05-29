//
//  FriendsViewController.swift
//  NIBMConnect
//
//  Created by Supun Chathuranga on 5/23/19.
//  Copyright © 2019 Supun Lakmal. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import Kingfisher



class FriendsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    var ref: DatabaseReference!
    var friendList:[Friends] = []
    var passFriend:Friends? = nil
    
    @IBOutlet weak var friendsViewTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.friendsViewTable.delegate = self
        self.friendsViewTable.dataSource = self
        ref = Database.database().reference()
        
        self.ref.child("Students").observeSingleEvent(of: .value) { (snapshot) in
            //get user value
            
            let value = snapshot.value as? NSDictionary
            print(value)
            var friends:[Friends] = []
            
            if snapshot.childrenCount > 0 {
                for friend in snapshot.children.allObjects as! [DataSnapshot]{
                    
                    let friendObject = friend.value as? [String:AnyObject]
                    let fri = Friends(id: friendObject!["Id"] as! String, fName: friendObject!["Fname"] as! String, lName: friendObject!["Lname"] as! String, fBLink: friendObject!["FBLink"] as! String, ph: friendObject!["PNumber"] as! String, bir: friendObject!["Birth"] as! String, pf: friendObject!["ProPic"] as! String, city: friendObject!["City"] as! String)
                    friends.append(fri)
                }
            }
            self.friendList = friends
            self.friendsViewTable.reloadData()
        }
        
        
        
    
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friendList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: FriendsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "friendsCell", for: indexPath)  as! FriendsTableViewCell
        
        let friend = friendList[indexPath.row]
        
        cell.fname.text = friend.Fname
        cell.lastName.text = friend.Lname
        cell.city.text = friend.City
        
        
        let url = URL(string: self.friendList[indexPath.row].PFPic)
        cell.profileImg.kf.setImage(with: url)

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        passFriend = friendList[indexPath.row]
        performSegue(withIdentifier: "showDetails", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetails" {
            if let ViewController = segue.destination as? StudentDViewController {
                ViewController.passFriend = passFriend
            }
            
        }
    }
    
}



