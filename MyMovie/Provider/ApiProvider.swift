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
    
    static func getMovie(urlString: String, completionHandler:@escaping (_ movies: [Movie]) -> (), errorHandler:@escaping (_ error: String) -> ()) {
        
        Alamofire.request(urlString).responseJSON { (response) in
            var movies = [Movie]()
            
            guard response.response?.statusCode == 200 else {
                errorHandler("Erro ao conectar com o servidor.")
                return
            }
            
            switch response.result {
            case .success(_):
                guard let json: [String: Any] = response.result.value as? [String: Any] else {
                    errorHandler("Erro ao conectar com o servidor.")
                    return
                }
                
                guard let dictArray = json["results"] as? [[String: Any]] else {
                    errorHandler("Erro ao conectar com o servidor.")
                    return
                }
                
                for array in dictArray {
                    movies.append(Movie(rawData: array))
                }
                completionHandler(movies)
                break
            case .failure(_):
                errorHandler("Erro ao conectar com o servidor.")
                break
            }
        }
    }
}
