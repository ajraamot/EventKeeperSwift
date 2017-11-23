//
//  Event.swift
//  EventKeeper
//
//  Created by Raamot, Andrew on 11/23/17.
//  Copyright © 2017 Raamot, Andrew. All rights reserved.
//

import UIKit

class Event: NSObject {
    var title: String?
    var details: String?
    
    init (title: String, details: String){
        self.title = title
        self.details = details
    }
    
    override init() {
        super.init()
    }
}
