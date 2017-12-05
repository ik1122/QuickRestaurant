//
//  Chore.swift
//  ChOrganizeApp
//
//  Created by Hana on 11/10/17.
//  Copyright © 2017 Pusheen Code. All rights reserved.
//

import UIKit

class Chore: NSObject{
    init?(name: String, price: String) {
        //if name.isEmpty {
          //  return nil
        //}
        self.name = name
        self.price = price
    }
    
    var name: String?
    var price: String?
    override init()
    {
    
    }
    
    override var description: String {
        return "Name: \(name), Price: \(price)"
    }
}
