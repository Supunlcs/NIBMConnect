//
//  HomeWorkCell.swift
//  NIBMConnect
//
//  Created by Supun Chathuranga on 6/2/19.
//  Copyright © 2019 Supun Lakmal. All rights reserved.
//

import UIKit

class HomeWorkCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
 
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setupCell(title:String){
        self.title.text = title
       
    }
}
