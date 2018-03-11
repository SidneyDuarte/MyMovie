//
//  HomeTableViewCell.swift
//  MyMovie
//
//  Created by Sidney Silva on 10/03/2018.
//  Copyright © 2018 Sakura Soft. All rights reserved.
//

import UIKit

class MainMoviesTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var movies: [Movie]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    
    func getMovie(movies: [Movie]) {
        self.movies = movies
        self.collectionView.reloadData()
    }
}

extension MainMoviesTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if self.movies!.count <= 0 {
            return 0
        }
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainMoveCollectionCell", for: indexPath) as! MainMoviesCollectionViewCell
        let movie = movies![indexPath.item]
        let backdropPath = movie.backdropPath
        let urlImage = "http://image.tmdb.org/t/p/w342/" + backdropPath!
        cell.movieImage.getImageUsingNSCache(withUrlString: urlImage)
        cell.movieName.text = movie.title!
        
        return cell
    }
}

extension MainMoviesTableViewCell: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}
