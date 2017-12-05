//
//  ChoreViewController.swift
//  ChOrganizeApp
//
//  Created by Hana on 11/10/17.
//  Copyright © 2017 Pusheen Code. All rights reserved.
//

import UIKit

class ChoreViewController: UIViewController {
    
    var name: String = ""
    var price: String = ""

    @IBOutlet weak var Drink: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var priceField: UITextField!

    @IBAction func completechore(_ sender: Any) {
        let alert = UIAlertController(title:"Confirm Menu Item" , message:"Add \(self.nameField.text!) for $\(self.priceField.text!)?" , preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .`default`, handler: { _ in
            //TODO: Mark chore as completed, change background color to green.
            let url = NSURL(string: "http://quickdrinks.000webhostapp.com/update_menu.php") // locahost MAMP - change to point to your database server
            
            var request = URLRequest(url: url! as URL)
            request.httpMethod = "POST"
            
            //var dataString = "secretWord=44fdcv8jf3" // starting POST string with a secretWord
            
            // the POST string has entries separated by &
            
            var dataString = "&drink=\(self.nameField.text!)"
                dataString = dataString + "&price=\(self.priceField.text!)"
            //let dataString = "\(self.Drink.text!)"
                print(self.Drink.text ?? "a")
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
        
        
            //Transition back to TabBarController
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let TabBarVC = storyboard.instantiateViewController(withIdentifier: "TabBarController") as! UITabBarController
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.rootViewController = TabBarVC
           //let NavBarVC = storyboard.instantiateViewController(withIdentifier: "NavBarController") as! UINavigationController
           //let appDelegate = UIApplication.shared.delegate as! AppDelegate
            
            
            appDelegate.window?.rootViewController = TabBarVC
            //appDelegate.window?.rootViewController = NavBarVC
        }))
        alert.addAction(UIAlertAction(title: NSLocalizedString("Cancel", comment: "Cancel"), style: .cancel, handler: { _ in
            NSLog("The \"Cancel\" alert occured.")
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
        @IBOutlet weak var descriptionlabel: UILabel!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Put border around decription text.
     //  descriptionlabel.layer.borderWidth = 0.5
      //  descriptionlabel.layer.cornerRadius = 8
        
        self.nameLabel.text = name
        self.priceLabel.text = price
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Send data over segue to indicate came from Edit button and set the title to "Edit Chore"
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editChore" {
            let destVC = segue.destination as! CreateChoreViewController
            destVC.origin = "editButton"
        }
    }
}
