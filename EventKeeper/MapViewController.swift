//
//  MapViewController.swift
//  EventKeeper
//
//  Created by Raamot, Andrew on 11/23/17.
//  Copyright © 2017 Raamot, Andrew. All rights reserved.
//

import Foundation
import UIKit
import MapKit

class MapViewController : UIViewController, MKMapViewDelegate {
    var mapView: MKMapView!
    
    let workLocation = CLLocationCoordinate2D(latitude: 41.888355, longitude: -87.635719)
    let work = MKPointAnnotation()
    let homeLocation = CLLocationCoordinate2D(latitude: 41.938938, longitude: -87.638602)
    let home = MKPointAnnotation()
    
    
    override func loadView() {
        mapView = MKMapView()
        view = mapView
        
        let segmentedControl = UISegmentedControl(items:["Standard", "Hybrid", "Satellite"])
        segmentedControl.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        segmentedControl.selectedSegmentIndex = 0
        
        segmentedControl.addTarget(self, action: #selector(MapViewController.mapTypeChanged(_:)), for: .valueChanged)
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
        //109
        //        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.topAnchor)
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 8)
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let initialLocation = CLLocation(latitude: 41.888888, longitude: -87.654321)
        centerMapOnLocation(location: initialLocation)
        
        // placing pins on the map
        work.coordinate = workLocation
        work.title = "Allstate"
        home.coordinate = homeLocation
        home.title = "Home"
        mapView.addAnnotation(work)
        mapView.addAnnotation(home)
        
        //        mapView!.animatesDrop = true
        //        mapView!.pinTintColor = .purple
        
        
    }
    
    func mapTypeChanged(_ segControl: UISegmentedControl) {
        switch segControl.selectedSegmentIndex {
        case 0: mapView.mapType = .standard
        case 1: mapView.mapType = .hybrid
        case 2: mapView.mapType = .satellite
        default: break
        }
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let regionRadius: CLLocationDistance = 7000 // meters
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius, regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    //  see https://www.hackingwithswift.com/read/19/3/annotations-and-accessory-views-mkpinannotationview
    //     https://stackoverflow.com/questions/24523702/stuck-on-using-mkpinannotationview-within-swift-and-mapkit
    //    func mapView(_ mapView: MKMapView,
    //                 viewFor annotation: MKAnnotation) -> MKAnnotationView? {
    //
    //        if annotation is MKUserLocation {
    //            //return nil so map view draws "blue dot" for standard user location
    //            return nil
    //        }
    //
    //        let reuseId = "pin"
    //
    //        var pinView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseId) as? MKPinAnnotationView
    //        if pinView == nil {
    //            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
    //            pinView!.canShowCallout = true
    //            pinView!.animatesDrop = true
    //            pinView!.pinTintColor = .purple
    //        }
    //        else {
    //            pinView!.annotation = annotation
    //        }
    //        
    //        return pinView
    //    }
    
    
    func returnThree() -> Int {
        return 2
    }
    
    
    
}



/* import UIKit
import MapKit

class MapViewController: UIViewController {
    
    var mapView: MKMapView!
    
    override func loadView() {
        // to create a map view programatically
        mapView = MKMapView()
        
        // set it as the view of this view controller
        view = mapView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
}
*/
