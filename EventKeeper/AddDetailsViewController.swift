//
//  AddDetailsViewController.swift
//  EventKeeper
//
//  Created by Raamot, Andrew on 11/23/17.
//  Copyright © 2017 Raamot, Andrew. All rights reserved.
//

import UIKit
import MapKit

class AddDetailsViewController: UIViewController {
    
    @IBOutlet var titleText: UITextField!
    
    @IBOutlet var addressText: UITextField!
    @IBOutlet var eventDetails: UITextView!
    @IBOutlet var saveButton: UIButton!
    @IBOutlet var cancelButton: UIButton!
    
//    @IBOutlet var activityIndicator: UIActivityIndicatorView!

            // MOVING THIS HERE FROM THE DETAILVIEWCONTROLLER
//    var preEvent : Event?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // MOVING THESE HERE FROM THE DETAILVIEWCONTROLLER
//        self.title = preEvent?.title
//        self.eventDetails.text = preEvent?.details
        
        // Do any additional setup after loading the view.
        print("in AddDetailsViewController")
        titleText.backgroundColor = UIColor.blue.withAlphaComponent(0.1)
        eventDetails.backgroundColor = UIColor.blue.withAlphaComponent(0.1)
        
        addressText.backgroundColor = UIColor.blue.withAlphaComponent(0.1)
        
        saveButton.isEnabled = false
        
        NotificationCenter.default.addObserver(self, selector: #selector(AddDetailsViewController.textTitleDidChange), name: NSNotification.Name.UITextFieldTextDidChange, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(AddDetailsViewController.eventDetailsDidChange), name: NSNotification.Name.UITextViewTextDidChange, object: nil)
        eventDetails.text = ""
        cancelButton.isEnabled = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @objc func textTitleDidChange(){
        handleButtonStates()
    }
    
    @objc func eventDetailsDidChange(){
        handleButtonStates()
    }
    
//    @IBAction func doneButton_click(_ sender: AnyObject) {
//        eventDetails.resignFirstResponder()
//    }
//    
//    @IBAction func titleDoneButton_click(_ sender: AnyObject) {
//        titleText.resignFirstResponder()
//    }
    
    func handleButtonStates(){
        //handle cancel button
        cancelButton.isEnabled = true
        
        //handle save button
        if(titleText.text != "" && eventDetails.text != ""){
            saveButton.isEnabled = true
            saveButton.setTitleColor(UIColor.white, for: UIControlState())
        }
        else {
            saveButton.isEnabled = false
            saveButton.setTitleColor(UIColor.lightGray, for: UIControlState())
        }
    }

    @IBAction func addressEntered(_ sender: Any) {
        //
        let address = addressText.text
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(address!) { (placemarks, error) in
            guard
                let placemarks = placemarks,
                let location = placemarks.first?.location
                else {
                    // handle no location found
                    return
            }
        }
    }

    
    @IBAction func saveButton_click(_ sender: Any) {
        print("Save button clicked")
        
//        activityIndicator.startAnimating()
        
        EventManager.AddEvent(titleText.text!, details: eventDetails.text, location: nil) // TODO: The location should not be nil
//        titleText.text = ""
//        eventDetails.text = ""
        
//        let time = DispatchTime.now() + Double(Int64(0.5 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
//        DispatchQueue.main.asyncAfter(deadline: time){
//            self.activityIndicator.stopAnimating()
//        }
    }

    @IBAction func cancelButton_click(_ sender: Any) {
        print("Cancel button clicked")
        titleText.text = ""
        eventDetails.text = ""
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
