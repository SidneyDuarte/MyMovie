//
//  Movie.swift
//  MyMovie
//
//  Created by Sidney Silva on 10/03/2018.
//  Copyright © 2018 Sakura Soft. All rights reserved.
//

import UIKit

class Movie: NSObject {
    var id: Int?
    var title: String?
    var overView: String?
    var posterPath: String?
    var backdropPath: String?
    var releaseDate: String?
    var voteAverange: Double?
    
    init(rawData: [String: Any]) {
        self.id = rawData["id"] as? Int
        self.title = rawData["title"] as? String
        self.overView = rawData["overview"] as? String
        self.posterPath = rawData["poster_path"] as? String
        self.backdropPath = rawData["backdrop_path"] as? String
        self.releaseDate = rawData["release_date"] as? String
        self.voteAverange = rawData["vote_average"] as? Double
    }
}
