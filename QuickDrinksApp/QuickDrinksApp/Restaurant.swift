//
//  Restaurant.swift
//  QuickDrinksApp
//
//  Created by Matthew Shimazu on 12/2/17.
//  Copyright © 2017 CS117. All rights reserved.
//

import UIKit

class Restaurant {
    init?(name: String) {
        if name.isEmpty {
            return nil
        }
        self.name = name
    }
    
    var name: String
}

