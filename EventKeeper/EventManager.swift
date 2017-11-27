//
//  EventManager.swift
//  EventKeeper
//
//  Created by Raamot, Andrew on 11/23/17.
//  Copyright © 2017 Raamot, Andrew. All rights reserved.
//

import UIKit
import MapKit

class EventManager: NSObject {
    static var events = [Event]()
    
    class func AddEvent(_ title: String, details: String?, locations: Array<CLLocationCoordinate2D?>?
//        , photos: Array<UIImage>
        ){
        let e = Event(title: title, details: details, locations: locations)
        
//        let e = Event(title: title, details: details, locations: Array<CLLocationCoordinate2D>, photos: Array<UIImage>)
        
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
