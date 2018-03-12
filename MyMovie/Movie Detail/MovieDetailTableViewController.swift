//
//  MovieDetailTableViewController.swift
//  MyMovie
//
//  Created by Sidney Silva on 11/03/2018.
//  Copyright © 2018 Sakura Soft. All rights reserved.
//

import UIKit

class MovieDetailTableViewController: UITableViewController {
    var movie: Movie?
    @IBOutlet weak var backDropImage: UIImageView!
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieDate: UILabel!
    @IBOutlet weak var userScore: UILabel!
    @IBOutlet weak var overView: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
    }

    func configureView(){
        self.movieName.text = movie!.title!
        self.userScore.text = "user score: \(movie!.voteAverange!)"
        self.overView.text = movie!.overView!
        
        let posterPath = movie!.posterPath!
        let urlImage = "http://image.tmdb.org/t/p/w342/" + posterPath
        self.posterImage.getImageUsingNSCache(withUrlString: urlImage)
        
        let backdropPath = movie!.backdropPath!
        let urlBackdrop = "http://image.tmdb.org/t/p/w342/" + backdropPath
        self.backDropImage.getImageUsingNSCache(withUrlString: urlBackdrop)
    }
}

// MARK: - Table view delegate

extension MovieDetailTableViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}
