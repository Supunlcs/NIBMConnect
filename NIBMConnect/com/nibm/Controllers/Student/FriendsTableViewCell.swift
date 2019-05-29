//
//  FriendsTableViewCell.swift
//  NIBMConnect
//
//  Created by Supun Chathuranga on 5/24/19.
//  Copyright © 2019 Supun Lakmal. All rights reserved.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {

  
    @IBOutlet weak var lastName: UILabel!
    @IBOutlet weak var fname: UILabel!
    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var profileImg: UIImageView!
    //@IBOutlet weak var profileImg: UIImageView!
 
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
