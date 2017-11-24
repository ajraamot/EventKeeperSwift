//
//  AddViewController.swift
//  EventKeeper
//
//  Created by Raamot, Andrew on 11/23/17.
//  Copyright © 2017 Raamot, Andrew. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet var titleText: UITextField!
    @IBOutlet var eventDetails: UITextView!
    @IBOutlet var doneButton: UIBarButtonItem!
//    @IBOutlet var addButton: UIButton!
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        print("in AddViewController")
        titleText.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        eventDetails.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        
//        addButton.isEnabled = false
        
        NotificationCenter.default.addObserver(self, selector: #selector(AddViewController.textTitleDidChange), name: NSNotification.Name.UITextFieldTextDidChange, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(AddViewController.eventDetailsDidChange), name: NSNotification.Name.UITextViewTextDidChange, object: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textTitleDidChange(){
//        handleButtonStates()
    }
    
    func eventDetailsDidChange(){
//        handleButtonStates()
    }
    
    @IBAction func doneButton_click(_ sender: AnyObject) {
        eventDetails.resignFirstResponder()
    }
    
    @IBAction func titleDoneButton_click(_ sender: AnyObject) {
        titleText.resignFirstResponder()
    }
    
    
    func handleButtonStates(){
        //handle done button
        if(eventDetails.text != ""){
            doneButton.isEnabled = true
        }
        else {
            doneButton.isEnabled = false
        }
        
        //handle add button
//        if(titleText.text != "" && eventDetails.text != ""){
//            addButton.isEnabled = true
//            addButton.setTitleColor(UIColor.white, for: UIControlState())
//        }
//        else {
//            addButton.isEnabled = false
//            addButton.setTitleColor(UIColor.lightGray, for: UIControlState())
//        }
    }
    
//    @IBAction func addButton_click(_ sender: AnyObject) {
//        
//        activityIndicator.startAnimating()
//        
//        EventManager.AddEvent(titleText.text!, details: eventDetails.text)
//        titleText.text = ""
//        eventDetails.text = ""
//        
//        let time = DispatchTime.now() + Double(Int64(0.5 * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
//        DispatchQueue.main.asyncAfter(deadline: time){
//            self.activityIndicator.stopAnimating()
//        }
//    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
