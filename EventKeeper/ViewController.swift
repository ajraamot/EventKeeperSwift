//
//  ViewController.swift
//  EventKeeper
//
//  Created by Raamot, Andrew on 11/23/17.
//  Copyright © 2017 Raamot, Andrew. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    func returnThree() -> Int {
        return 3
    }
    
    // TODO: Replace array with CoreData
    let array = EventManager.events

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.rowHeight = 50
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.reloadData()
        navigationController?.navigationBar.alpha = 0.5
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // a delegate that tells the table view how many rows are in the table
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EventManager.events.count
//        return EventManager.events.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell")!
        cell.textLabel?.text = EventManager.events[indexPath.item].title
        cell.backgroundColor = UIColor.green.withAlphaComponent(0.2)
        cell.textLabel?.textColor = UIColor.blue.withAlphaComponent(0.8)
        return cell
        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as! ListCell
//        
//        if(indexPath.item % 2 == 0){
//            cell.backgroundColor = UIColor.clear
//        }
//        else {
//            cell.backgroundColor = UIColor.white.withAlphaComponent(0.2)
//            cell.textLabel?.backgroundColor = UIColor.white.withAlphaComponent(0.0)
//        }
//        
//        cell.textLabel?.textColor = UIColor.white
//        let event = EventManager.events[indexPath.item]
//        cell.textLabel?.text = event.title
//        cell.event = event
//        return cell
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "detailview"){
            let cell = sender as! ListCell
            let detailview = segue.destination as! DetailViewController
            detailview.preEvent = cell.event
        }
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if(segue.identifier == "AddDetailsViewController"){
//            let cell = sender as! ListCell
//            let detailview = segue.destination as! AddDetailsViewController
//            AddDetailsViewController.preEvent = cell.event
//        }
//    }
    
}

