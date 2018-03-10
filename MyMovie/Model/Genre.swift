//
//  Genre.swift
//  MyMovie
//
//  Created by Sidney Silva on 10/03/2018.
//  Copyright © 2018 Sakura Soft. All rights reserved.
//

import UIKit

class Genre: NSObject {
    var id: Int?
    var genreName: String?
    
    init(id: Int, genreName: String) {
        self.id = id
        self.genreName = genreName
    }
}
