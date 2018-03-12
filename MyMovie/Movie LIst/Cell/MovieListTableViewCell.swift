//
//  MovieListTableViewCell.swift
//  MyMovie
//
//  Created by Sidney Silva on 11/03/2018.
//  Copyright © 2018 Sakura Soft. All rights reserved.
//

import UIKit

class MovieListTableViewCell: UITableViewCell {

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieRating: UILabel!
    @IBOutlet weak var movieYear: UILabel!
    @IBOutlet weak var movieOverview: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.movieImage.image = nil
        self.movieName.text = ""
        self.movieOverview.text = ""
        self.movieRating.text = ""
        self.movieYear.text = ""
    }
}
