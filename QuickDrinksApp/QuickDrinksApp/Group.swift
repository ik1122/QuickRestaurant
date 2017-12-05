//
//  Group.swift
//  ChOrganizeApp
//
//  Created by CLICC User on 11/11/17.
//  Copyright © 2017 Pusheen Code. All rights reserved.
//

import UIKit

class Group: NSObject{
    init?(name: String, status: String) {
        //if name.isEmpty {
          //  return nil
        //}
        self.name = name
        self.status = status
    }
    
    var name: String?
    var status: String?
    override init()
    {
        
    }
    override var description: String {
        return "Name: \(name), Status: \(status)"
    }
}

