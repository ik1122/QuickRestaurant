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
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item: Group = feedItems[indexPath.row] as! Group
            //item.name is useful
            let url = NSURL(string: "http://quickdrinks.000webhostapp.com/update_status_ready.php") // locahost MAMP - change to point to your database server
            
            var request = URLRequest(url: url! as URL)
            request.httpMethod = "POST"
            
            //var dataString = "secretWord=44fdcv8jf3" // starting POST string with a secretWord
            
            // the POST string has entries separated by &
            
            let dataString = "&drink=\(item.name)&status=Ready"
           
            //let dataString = "\(self.Drink.text!)"
            print(dataString)
            // add items as name and value
            // convert the post string to utf8 format
            
            let dataD = dataString.data(using: .utf8) // convert to utf8 string
            print(dataD ?? "dataD")
            do
            {
                
                // the upload task, uploadJob, is defined here
                
                let uploadJob = URLSession.shared.uploadTask(with: request, from: dataD)
                {
                    data, response, error in
                    
                    if error != nil {
                        
                        // display an alert if there is an error inside the DispatchQueue.main.async
                        
                        DispatchQueue.main.async
                            {
                                let alert = UIAlertController(title: "Upload Didn't Work?", message: "Looks like the connection to the server didn't work.  Do you have Internet access?", preferredStyle: .alert)
                                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                                self.present(alert, animated: true, completion: nil)
                        }
                    }
                    else
                    {
                        if let unwrappedData = data {
                            
                            let returnedData = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue) // Response from web server hosting the database
                            
                            if returnedData == "1" // insert into database worked
                            {
                                
                                // display an alert if no error and database insert worked (return = 1) inside the DispatchQueue.main.async
                                
                                DispatchQueue.main.async
                                    {
                                        let alert = UIAlertController(title: "Upload OK?", message: "Looks like the upload and insert into the database worked.", preferredStyle: .alert)
                                        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                                        self.present(alert, animated: true, completion: nil)
                                }
                            }
                            else
                            {
                                // display an alert if an error and database insert didn't worked (return != 1) inside the DispatchQueue.main.async
                                
                                DispatchQueue.main.async
                                    {
                                        
                                        let alert = UIAlertController(title: "Upload Didn't Work", message: "Looks like the insert into the database did not worked.", preferredStyle: .alert)
                                        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                                        self.present(alert, animated: true, completion: nil)
                                }
                            }
                        }
                    }
                }
                uploadJob.resume()
            }

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

    
}
