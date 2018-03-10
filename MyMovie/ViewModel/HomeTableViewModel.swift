//
//  HomeTableViewModel.swift
//  MyMovie
//
//  Created by Sidney Silva on 10/03/2018.
//  Copyright © 2018 Sakura Soft. All rights reserved.
//

import UIKit

class HomeTableViewModel: NSObject {
    
    func numberOfRows(section: Int) -> Int {
        return section
    }
    
    func populateCollectionViewCell(indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            break
        default:
            break
        }
    }
    
    func getMostPopularMovie(completionHandler: @escaping (_ moviesArray: [Movie]) -> ()){
        ApiProvider.getMovie(urlString: Constants.UrlConstants.nowPlayingUrl, completionHandler: { (movies) in
            
        }) { (error) in
            
        }
    }
    
    func getComedyMovie() {
        
    }
    
    func getMoviesByGenre(genre: Genre) {
        
    }
    
    
}
