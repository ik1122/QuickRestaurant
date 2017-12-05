//
//  SecondViewController.swift
//  ChOrganizeApp
//
//  Created by Hana on 11/4/17.
//  Copyright © 2017 Pusheen Code. All rights reserved.
//

import UIKit

class RestaurantsViewController: UITableViewController {
    var restaurants = [Restaurant]()
    
    private func loadToDoList() {
        let restaurant1 = Restaurant(name: "restaurant 1")
        //let restaurant2 = Restaurant(name: "restaurant 2")
        restaurants.insert(restaurant1!,at: 0)
       // restaurants.insert(restaurant2!, at: 1)
    }
    
    //    func numberOfSections(in tableView: UITableView) -> Int
    //    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    //    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    //
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantsTableViewCell", for: indexPath) as? RestaurantsTableViewCell
        
        let restaurant = restaurants[indexPath.row]
        
        cell!.nameLabel.text = restaurant.name
        return cell!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        loadToDoList()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
        
    
    
}


