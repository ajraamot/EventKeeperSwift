//
//  EventManager.swift
//  EventKeeper
//
//  Created by Raamot, Andrew on 11/23/17.
//  Copyright © 2017 Raamot, Andrew. All rights reserved.
//

import UIKit

class EventManager: NSObject {
    static var events = [Event]()
    
    class func AddEvent(_ title: String, details: String){
        let e = Event(title: title, details: details)
        events.append(e)
    }
    
    class func DeleteEvent(_ id: Int){
        events.remove(at: id)
    }
    
    class func GetEvent(_ id: Int) -> Event {
        if(events.count > 0){
            return events[id]
        }
        
        return Event()
    }
    
}
