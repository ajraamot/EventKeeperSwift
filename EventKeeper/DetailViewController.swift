//
//  DetailViewController.swift
//  EventKeeper
//
//  Created by Raamot, Andrew on 11/23/17.
//  Copyright © 2017 Raamot, Andrew. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var preEvent:Event?
    @IBOutlet var eventDetails: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        eventDetails.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.title = preEvent?.title
        self.eventDetails.text = preEvent?.details
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

