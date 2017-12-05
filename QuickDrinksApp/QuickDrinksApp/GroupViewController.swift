//
//  SecondViewController.swift
//  ChOrganizeApp
//
//  Created by Hana on 11/4/17.
//  Copyright © 2017 Pusheen Code. All rights reserved.
//

import UIKit

class GroupViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, GetOrderInfo  {
    
    //Properties
    var feedItems: NSArray = NSArray()
    var selectedChore : Group = Group()
    //@IBOutlet weak var ToDoTableView: UITableView!
    //@IBOutlet var GroupTableView: UITableView!
    @IBOutlet var GroupTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set delegates and initialize homeModel
        
        self.GroupTableView.delegate = self
        self.GroupTableView.dataSource = self
        
        let orderInfo = OrderInfo()
        orderInfo.delegate = self
        orderInfo.downloadItems()
        
    }
    
    func itemsDownloaded(items: NSArray) {
        
        feedItems = items
        self.GroupTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of feed items
        return feedItems.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Retrieve cell
        // let cellIdentifier: String = "ToDoTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupTableViewCell", for: indexPath) as? GroupTableViewCell
        // Get the location to be shown
        let item: Group = feedItems[indexPath.row] as! Group
        // Get references to labels of cell
        cell!.nameLabel.text = item.name
        cell!.statusLabel.text = item.status
        
        return cell!
    }
    //    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //        let item: Chore = feedItems[indexPath.row] as! Chore
    //        print(item.name ?? "e")
    //        print(item.price ?? "f")
    //        name1 = item.name ?? "e"
    //        price1 = item.price ?? "f"
    //        performSegue(withIdentifier: "test", sender: self)
    //        
    //    }
    

    //    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoTableViewCell", for: indexPath) as? ToDoTableViewCell
    //
    //        let chore = chores[indexPath.row]
    //
    //        cell!.nameLabel.text = chore.name
    //
    //        return cell!
    //    }

    
}
