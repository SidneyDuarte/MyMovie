//
//  ApiProvider.swift
//  MyMovie
//
//  Created by Sidney Silva on 10/03/2018.
//  Copyright © 2018 Sakura Soft. All rights reserved.
//

import UIKit
import Alamofire

class ApiProvider: NSObject {
    
    static func getMovie(withURLString urlString: String, andCompletionHandler completionHandler:@escaping (_ movies: [Movie], _ totalPages: Int, _ currentPage: Int) -> ()) {
        
        Alamofire.request(urlString).responseJSON { (response) in
            var movies = [Movie]()
            
            guard response.response?.statusCode == 200 else {
                completionHandler(movies, 0, 0)
                return
            }
            
            switch response.result {
            case .success(_):
                guard let json: [String: Any] = response.result.value as? [String: Any] else {
                    completionHandler(movies, 0, 0)
                    return
                }
                
                guard let dictArray = json["results"] as? [[String: Any]] else {
                    completionHandler(movies, 0, 0)
                    return
                }
                
                guard let totalPages = json["total_pages"] as? Int else {
                    completionHandler(movies, 0, 0)
                    return
                }
                
                guard let currentPage = json["page"] as? Int else {
                    completionHandler(movies, 0, 0)
                    return
                }
                
                for data in dictArray {
                    movies.append(Movie(rawData: data))
                }
                completionHandler(movies, totalPages, currentPage)
                break
            case .failure(_):
                completionHandler(movies, 0, 0)
                break
            }
        }
    }
    
    static func getGenre(completionHandler: @escaping (_ genre: [Genre]) -> ()){
        Alamofire.request(Constants.UrlConstants.getAllGenres).responseJSON { (response) in
            var genres = [Genre]()
            guard response.response?.statusCode == 200 else {
                completionHandler(genres)
                return
            }
            
            switch response.result {
            case .success(_):
                guard let json: [String: Any] = response.result.value as? [String: Any] else {
                    completionHandler(genres)
                    return
                }
                
                guard let dictArray = json["genres"] as? [[String: Any]] else {
                    completionHandler(genres)
                    return
                }
                
                for data in dictArray {
                    genres.append(Genre(rawData: data))
                }
                completionHandler(genres)
                break
            case .failure(_):
                completionHandler(genres)
                break
            }
        }
    }
}
