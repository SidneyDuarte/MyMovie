//
//  HomeMoviesCellTableViewCell.swift
//  MyMovie
//
//  Created by Sidney Silva on 11/03/2018.
//  Copyright © 2018 Sakura Soft. All rights reserved.
//

import UIKit

class HomeMoviesTableViewCell: UITableViewCell {
    var movies: [Movie]?
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var title: UILabel!
    var delegate: MovieDelegate?
    @IBOutlet weak var viewAllButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
    }

    @IBAction func tapViewAllButton(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            self.delegate?.getUrl(urlString: Constants.UrlConstants.popularUrl)
            break
        case 1:
            self.delegate?.getUrl(urlString: Constants.UrlConstants.topRatedMovies)
            break
        case 2:
            self.delegate?.getUrl(urlString: Constants.UrlConstants.upcomingMovies)
            break
        default:
            break
        }
    }
    
    func getMovie(movies: [Movie]) {
        self.movies = movies
        self.collectionView.reloadData()
    }
}

extension HomeMoviesTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if movies!.count <= 0 {
            return 0
        }else if movies!.count < 10 {
            return movies!.count
        }
        
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryMovieCell", for: indexPath) as! HomeMoviesCollectionViewCell
        let movie = movies![indexPath.item]
        let posterPath = movie.posterPath
        let movieYear = movie.releaseDate!
        let urlImage = "http://image.tmdb.org/t/p/w342/" + posterPath!
        cell.movieImage.getImageUsingNSCache(withUrlString: urlImage)
        cell.movieName.text = movie.title!
        cell.movieYear.text = movieYear
        return cell
    }
}

extension HomeMoviesTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = movies![indexPath.row]
        self.delegate?.getMovie(movie: movie)
    }
}



