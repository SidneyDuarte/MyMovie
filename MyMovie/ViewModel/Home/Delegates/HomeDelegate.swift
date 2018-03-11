//
//  HomeDelegate.swift
//  MyMovie
//
//  Created by Sidney Silva on 11/03/2018.
//  Copyright © 2018 Sakura Soft. All rights reserved.
//

import UIKit

protocol HomeDelegate {
    func getNowPlayingMovies(movies: [Movie])
    func getPopularMovies(movies: [Movie])
    func getTopRatingMovies(movies: [Movie])
    func getUpcomingMovies(movies: [Movie])
    func getError(error: String)
}
