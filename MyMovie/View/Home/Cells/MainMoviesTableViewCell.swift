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
    var mainMoviesViewCell = MainMoviesCellViewMOdel()
    var movies: [Movie]?
    var delegate: MovieDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = self.configureLayout()
        self.startTimer()
    }
    
    func configureLayout() -> UICollectionViewFlowLayout {
        let width = UIApplication.shared.keyWindow?.frame.size.width
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: width!, height: 220)
        layout.scrollDirection = .horizontal
        
        return layout
    }
    
    @objc func scrollToNextCell(){
        self.mainMoviesViewCell.configureScrollCell(collectionView: self.collectionView)
    }

    func startTimer() {
        Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(MainMoviesTableViewCell.scrollToNextCell), userInfo: nil, repeats: true)
    }
    
    func getMovie(movies: [Movie]) {
        self.movies = movies
        self.collectionView.reloadData()
    }
}

extension MainMoviesTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let rows = mainMoviesViewCell.getNumberOfItensInSection(movies: movies!)
        return rows
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
        let movie = movies![indexPath.row]
        self.delegate?.getMovie(movie: movie)
    }
    
}
