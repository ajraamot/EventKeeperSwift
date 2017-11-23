//
//  ListCell.swift
//  EventKeeper
//
//  Created by Raamot, Andrew on 11/23/17.
//  Copyright © 2017 Raamot, Andrew. All rights reserved.
//

import UIKit

class ListCell: UITableViewCell {
    
    var event:Event?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

