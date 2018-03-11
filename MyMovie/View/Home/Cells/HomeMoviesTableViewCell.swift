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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.collectionView.dataSource = self
        //self.collectionView.delegate = self
    }
    
    @IBAction func tapViewAll(_ sender: Any) {
        print("Touch!")
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



