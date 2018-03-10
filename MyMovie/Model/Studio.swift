//
//  Studio.swift
//  MyMovie
//
//  Created by Sidney Silva on 10/03/2018.
//  Copyright © 2018 Sakura Soft. All rights reserved.
//

import UIKit

class Studio: NSObject {
    var id: Int?
    var name: String?
    var country: String?
    
    init(id: Int, name: String, country: String) {
        self.id = id
        self.name = name
        self.country = country
    }
}
