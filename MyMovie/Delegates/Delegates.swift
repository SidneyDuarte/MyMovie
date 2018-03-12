//
//  Delegates.swift
//  MyMovie
//
//  Created by Sidney Silva on 11/03/2018.
//  Copyright © 2018 Sakura Soft. All rights reserved.
//

import UIKit

protocol GenreDelegate {
    func getGenre(genre: Genre)
}

protocol MovieDelegate {
    func getMovie(movie: Movie)
    func getUrl(urlString: String)
}
