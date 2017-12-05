//
//  FirstViewController.swift
//  ChOrganizeApp
//
//  Created by Hana on 11/4/17.
//  Copyright © 2017 Pusheen Code. All rights reserved.
//

//import UIKit
//
//class ToDoViewController: UITableViewController {
//    
//    @IBOutlet var ToDoTableView: UITableView!
//    var chores = [Chore]()
//
//    private func loadToDoList() {
//        let chore1 = Chore(name: "Drink Example", price: "$10")
//        let chore2 = Chore(name: "Drink 2", price: "$20")
//        chores.insert(chore1!,at: 0)
//        chores.insert(chore2!, at: 1)
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        loadToDoList()
//    }
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//    // Setup tableView
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return chores.count
//    }
//    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoTableViewCell", for: indexPath) as? ToDoTableViewCell
//        
//        let chore = chores[indexPath.row]
//        
//        cell!.nameLabel.text = chore.name
//        
//        return cell!
//    }
//}
//
import UIKit

class ToDoViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, GetInfo  {
    
    //Properties
    var name1: String = ""
    var price1: String = ""
    var feedItems: NSArray = NSArray()
    var selectedChore : Chore = Chore()
    //@IBOutlet weak var ToDoTableView: UITableView!
    @IBOutlet var ToDoTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set delegates and initialize homeModel
        
        self.ToDoTableView.delegate = self
        self.ToDoTableView.dataSource = self
        
        let info = Info()
        info.delegate = self
        info.downloadItems()
        
    }
    
    func itemsDownloaded(items: NSArray) {
        
        feedItems = items
        self.ToDoTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of feed items
        return feedItems.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        // Retrieve cell
       // let cellIdentifier: String = "ToDoTableViewCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoTableViewCell", for: indexPath) as? ToDoTableViewCell
        // Get the location to be shown
        let item: Chore = feedItems[indexPath.row] as! Chore
        // Get references to labels of cell
        cell!.nameLabel.text = item.name
        cell!.priceLabel.text = item.price
    
        return cell!
    }
    //    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    //        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoTableViewCell", for: indexPath) as? ToDoTableViewCell
    //
    //        let chore = chores[indexPath.row]
    //
    //        cell!.nameLabel.text = chore.name
    //
    //        return cell!
    //    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let item: Chore = feedItems[indexPath.row] as! Chore
//        print(item.name ?? "e")
//        print(item.price ?? "f")
//        name1 = item.name ?? "e"
//        price1 = item.price ?? "f"
//        performSegue(withIdentifier: "test", sender: self)
//        
//    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // get a reference to the second view controller
        if segue.identifier == "test"{
        let secondviewController = segue.destination as! ChoreViewController
        
        // set a variable in the second view controller with the String to pass
        secondviewController.name = name1
        secondviewController.price = price1
        print("second")
        }
        else{
        print("first")
        }
    }
}

