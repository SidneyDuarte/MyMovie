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
    var originalTitle: String?
    var overView: String?
    var posterPath: String?
    var isAdult: Bool?
    var budget: Double?
    var genres: [Genre]?
    var originalLanguage: String?
    var popularity: Double?
    var releaseDate: Date?
    var studios: [Studio]?
    var voteAverange: Double?
    var voteCount: Int?
    
    init(id: Int, title: String, originalTitle: String, overView: String, posterPath: String, isAdult: Bool, budget: Double, genres: [Genre], originalLanguage: String, popularity: Double, releaseDate: Date, studios: [Studio], voteAverange: Double, voteCount: Int) {
        self.id = id
        self.title = title
        self.originalTitle = originalTitle
        self.overView = overView
        self.posterPath = posterPath
        self.isAdult = isAdult
        self.budget = budget
        self.genres = genres
        self.originalLanguage = originalLanguage
        self.popularity = popularity
        self.releaseDate = releaseDate
        self.studios = studios
        self.voteAverange = voteAverange
        self.voteCount = voteCount
    }
}
