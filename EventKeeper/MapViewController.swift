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
import CoreLocation

class MapViewController : UIViewController, MKMapViewDelegate, UITextFieldDelegate {
    var mapView: MKMapView!
    
    @IBOutlet var latitudeField: UITextField!
    @IBOutlet var longitudeField: UITextField!
    @IBOutlet var annotationField: UITextField!
    @IBOutlet var addressField: UITextField!

    var latitude: Double = 0.0
    var longitude: Double = 0.0
    
    var searchButton = UIButton()
    var goButton = UIButton()
    var saveButton = UIButton()
    
    var areCoordinatesValid: Bool = false
    
    override func loadView() {
        mapView = MKMapView()
        view = mapView
        
        
        // To have the Standard, Hybrid, Satellite switch
        let segmentedControl = UISegmentedControl(items:["Standard", "Hybrid", "Satellite"])
        segmentedControl.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        segmentedControl.selectedSegmentIndex = 0
        
        segmentedControl.addTarget(self, action: #selector(MapViewController.mapTypeChanged(_:)), for: .valueChanged)
        
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 8)
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        
        topConstraint.isActive = true
        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
        
        // annotation field
        annotationField = UITextField(frame: CGRect(x: 20, y: 140, width: 150, height: 20))
        annotationField.placeholder = "location label"
        annotationField.textColor = UIColor.black
        annotationField.delegate = self
        annotationField.backgroundColor? = UIColor.clear
        annotationField.borderStyle = UITextBorderStyle.roundedRect
        annotationField.clearsOnBeginEditing = true
        view.addSubview(annotationField)
        
        // address field
        addressField = UITextField(frame: CGRect(x: 20, y: 100, width: 280, height: 20))
        addressField.placeholder = "address"
        addressField.textColor = UIColor.black
        addressField.delegate = self
        addressField.backgroundColor? = UIColor.clear
        addressField.borderStyle = UITextBorderStyle.roundedRect
        addressField.clearsOnBeginEditing = true
        view.addSubview(addressField)

        searchButton = UIButton(frame: CGRect(x: 290, y: 100, width: 60, height: 20))
        searchButton.backgroundColor = .blue
        searchButton.tintColor = .white
        searchButton.setTitle("Search", for: .normal)
        searchButton.addTarget(self, action:#selector(self.searchButton_click), for: .touchUpInside)
        self.view.addSubview(searchButton)
        
        // to add coordinate fields
        latitudeField = UITextField(frame: CGRect(x: 20, y: 120, width: 100, height: 20))
        latitudeField.placeholder = "latitude"
        latitudeField.textColor = UIColor.black
        latitudeField.delegate = self
        latitudeField.backgroundColor? = UIColor.clear
        latitudeField.borderStyle = UITextBorderStyle.roundedRect
        latitudeField.clearsOnBeginEditing = false
        view.addSubview(latitudeField)
        
        longitudeField = UITextField(frame: CGRect(x: 120, y: 120, width: 100, height: 20))
        longitudeField.placeholder = "longitude"
        longitudeField.textColor = UIColor.black
        longitudeField.delegate = self
        longitudeField.backgroundColor? = UIColor.clear
        longitudeField.borderStyle = UITextBorderStyle.roundedRect
        longitudeField.clearsOnBeginEditing = false
        view.addSubview(longitudeField)
        
        goButton = UIButton(frame: CGRect(x: 225, y: 120, width: 30, height: 20))
        goButton.backgroundColor = .blue
        goButton.tintColor = .white
        goButton.setTitle("Go!", for: .normal)
        goButton.addTarget(self, action:#selector(self.goButton_click), for: .touchUpInside)
        self.view.addSubview(goButton)
        
        saveButton = UIButton(frame: CGRect(x: 260, y: 120, width: 50, height: 20))
        saveButton.backgroundColor = .gray
        saveButton.tintColor = .white
        saveButton.setTitle("Save", for: .normal)
        saveButton.addTarget(self, action:#selector(self.saveButton_click), for: .touchUpInside)
        saveButton.isEnabled = false
        self.view.addSubview(saveButton)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let initialLocation = CLLocation(latitude: 41.888888, longitude: -87.654321)
        centerMapOnLocation(location: initialLocation)
        
        
        //        mapView!.animatesDrop = true
        //        mapView!.pinTintColor = .purple
    }
    
    
    @objc func searchButton_click(sender: UIButton) {
//        To convert address to coordinates (Need to import CoreLocation)
//         
//         let address = "1 Infinite Loop, Cupertino, CA 95014"
//         
        let address = addressField.text
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(address!) { (placemarks, error) in guard
        let placemarks = placemarks,
        let location = placemarks.first?.location
        else {
         // handle no location found
        return
        }
            self.latitudeField.text = String(location.coordinate.latitude)
            self.longitudeField.text = String(location.coordinate.longitude)
        }
         
        
       
    }
    
    @objc func goButton_click(sender: UIButton){
        print("go button Clicked")
        if !((latitudeField.text?.isEmpty)! || (longitudeField.text?.isEmpty)!) {
            latitude = Double(latitudeField.text!)!
            longitude = Double(longitudeField.text!)!
            let inputCoordinates = CLLocation(latitude: latitude, longitude: longitude)
            centerMapOnLocation(location: inputCoordinates)
            
            let inputLocation = MKPointAnnotation()
            inputLocation.coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
            inputLocation.title = annotationField.text
            mapView.addAnnotation(inputLocation)
            areCoordinatesValid = true
            saveButton.backgroundColor = .blue
            saveButton.isEnabled = true
        }
        
    }
    
    @objc func saveButton_click(sender: UIButton) {
        print("save button Clicked")
        if areCoordinatesValid {

            EventManager.AddEvent(
//                titleText.text!, details: eventDetails.text, 
                "Foo", details: "Bar", location: CLLocationCoordinate2D(latitude: latitude, longitude: longitude))
        }
        
    }
    
    @objc func mapTypeChanged(_ segControl: UISegmentedControl) {
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
