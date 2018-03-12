//
//  Constants.swift
//  MyMovie
//
//  Created by Sidney Silva on 10/03/2018.
//  Copyright © 2018 Sakura Soft. All rights reserved.
//

import UIKit

struct Constants {
    struct UrlConstants {
        static let nowPlayingUrl = "https://api.themoviedb.org/3/movie/now_playing?api_key=a1a9e1de8e67ed65ed9dad9828127182"
        static let popularUrl = "https://api.themoviedb.org/3/movie/popular?api_key=a1a9e1de8e67ed65ed9dad9828127182"
        static let topRatedMovies = "https://api.themoviedb.org/3/movie/top_rated?api_key=a1a9e1de8e67ed65ed9dad9828127182"
        static let upcomingMovies = "https://api.themoviedb.org/3/movie/upcoming?api_key=a1a9e1de8e67ed65ed9dad9828127182"
        static let getAllGenres = "https://api.themoviedb.org/3/genre/movie/list?api_key=a1a9e1de8e67ed65ed9dad9828127182"
        static let filterByGenreUrl = "https://api.themoviedb.org/3/discover/movie?api_key=a1a9e1de8e67ed65ed9dad9828127182&sort_by=popularity.desc&include_adult=false&include_video=true&with_genres="
    }
    
    struct CategoryConstants {
        static let categoryList = ["Top Rated", "Popular", "Upcoming"]
    }
}
