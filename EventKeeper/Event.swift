//
//  Event.swift
//  EventKeeper
//
//  Created by Raamot, Andrew on 11/23/17.
//  Copyright © 2017 Raamot, Andrew. All rights reserved.
//

import UIKit
import MapKit

class Event: NSObject {
    var title: String?
    var details: String?
    var locations: Array<CLLocationCoordinate2D?>?
    var photos: Array<UIImage?>?
    
    init (title: String, details: String? = nil, locations: Array<CLLocationCoordinate2D?>? = nil, photos: Array<UIImage?>? = nil){
        self.title = title
        self.details = details
        self.locations = locations
        self.photos = photos
//         // to add images photos.append(UIImage(named: "mypic.jpg")!)
    }

    init (title: String, details: String? = nil, locations: Array<CLLocationCoordinate2D?>? = []){
        self.title = title
        self.details = details
        self.locations = locations
    }
    
    override init() {
        super.init()
    }
}
