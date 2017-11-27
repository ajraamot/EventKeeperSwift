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
    @IBOutlet var eventDetails: UITextView!
//    @IBOutlet var doneButton: UIBarButtonItem!
    @IBOutlet var saveButton: UIButton!
    @IBOutlet var cancelButton: UIButton!
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        print("in AddDetailsViewController")
        titleText.backgroundColor = UIColor.blue.withAlphaComponent(0.1)
        eventDetails.backgroundColor = UIColor.blue.withAlphaComponent(0.1)
        
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
    
    func textTitleDidChange(){
        handleButtonStates()
    }
    
    func eventDetailsDidChange(){
        handleButtonStates()
    }
    
//    @IBAction func doneButton_click(_ sender: AnyObject) {
//        eventDetails.resignFirstResponder()
//    }
//    
//    @IBAction func titleDoneButton_click(_ sender: AnyObject) {
//        titleText.resignFirstResponder()
//    }
    
    @IBAction func cancelButton_click(_ sender: AnyObject) {
            print("Cancel button clicked")
    }
    
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
    
    @IBAction func saveButton_click(_ sender: AnyObject) {
        print("Save button clicked")
        
        activityIndicator.startAnimating()
        
        EventManager.AddEvent(titleText.text!, details: eventDetails.text, locations: nil) // TODO: This should not be nil
        titleText.text = ""
        eventDetails.text = ""
        
        let time = DispatchTime.now() + Double(Int64(0.5 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
        DispatchQueue.main.asyncAfter(deadline: time){
            self.activityIndicator.stopAnimating()
        }
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
