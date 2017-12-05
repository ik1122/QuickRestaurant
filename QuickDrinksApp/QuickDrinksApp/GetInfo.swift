//
//  GetInfo.swift
//  QuickDrinksApp
//
//  Created by CLICC User on 12/2/17.
//  Copyright © 2017 CS117. All rights reserved.
//

import Foundation

protocol GetInfo: class{
    func itemsDownloaded(items: NSArray)
}

class Info: NSObject, URLSessionDataDelegate {
    weak var delegate: GetInfo!
    
    var data = Data()
    
    let urlPath: String = "http://quickdrinks.000webhostapp.com/drinks.php"
    
    func downloadItems() {
        let url: URL = URL(string: urlPath)!
        let defaultSession = Foundation.URLSession(configuration: URLSessionConfiguration.default)
        
        let task = defaultSession.dataTask(with: url) { (data, response, error) in
            
            if error != nil{
                print("Failed to download data")
            }
            else {
                print("Data downloaded")
                self.parseJSON( data!)
            }
        }
        task.resume()
    
    }


func parseJSON(_ data:Data) {
    
    var jsonResult = NSArray()
    
    do{
        jsonResult = try JSONSerialization.jsonObject(with: data, options:JSONSerialization.ReadingOptions.allowFragments) as! NSArray
        
    } catch let error as NSError {
        print(error)
        
    }
    
    var jsonElement = NSDictionary()
    let chores = NSMutableArray()
    
    for i in 0 ..< jsonResult.count
    {
        
        jsonElement = jsonResult[i] as! NSDictionary
        
        let chore = Chore()
        
        //the following insures none of the JsonElement values are nil through optional binding
        if let name = jsonElement["drink"] as? String,
            let price = jsonElement["price"] as? String
        {
            
            chore.name = name
            chore.price = price
        }
        
        chores.add(chore)
        
    }
    
    DispatchQueue.main.async(execute: { () -> Void in
        
        self.delegate.itemsDownloaded(items: chores)
        
    })
}
}
