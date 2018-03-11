//
//  HomeTableViewModel.swift
//  MyMovie
//
//  Created by Sidney Silva on 10/03/2018.
//  Copyright © 2018 Sakura Soft. All rights reserved.
//

import UIKit

class HomeTableViewModel: NSObject {
    
    let homeDelegate: HomeDelegate?
    
    init(delegate: HomeDelegate) {
        self.homeDelegate = delegate
    }
    
    func getMovies(completionHandler: @escaping (_ : Bool) -> ()){
        ApiProvider.getMovie(withURLString: Constants.UrlConstants.nowPlayingUrl, andCompletionHandler: { (movies) in
            self.homeDelegate?.getNowPlayingMovies(movies: movies)
            
            ApiProvider.getMovie(withURLString: Constants.UrlConstants.popularUrl, andCompletionHandler: { (movies) in
                self.homeDelegate?.getPopularMovies(movies: movies)
                
                ApiProvider.getMovie(withURLString: Constants.UrlConstants.topRatedMovies, andCompletionHandler: { (movies) in
                    self.homeDelegate?.getUpcomingMovies(movies: movies)
                    completionHandler(true)
                })
            })
        })
    }
    
    func numberOfItensInCell(section: Int) -> Int{
        switch section {
        case 0:
            return 3
        case 4:
            return 1
        default:
            return 10
        }
    }
}
