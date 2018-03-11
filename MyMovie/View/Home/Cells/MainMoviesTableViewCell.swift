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
    var currentItem: Int = 1
    var movies: [Movie]?
    
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
        let indexPath = IndexPath(item: self.currentItem, section: 0)

        if self.currentItem < self.collectionView.numberOfItems(inSection: 0) {
            self.collectionView.scrollToItem(at: indexPath, at: .right, animated: true)
            
            currentItem += 1
        } else {
            let initialIndex = IndexPath(item: 0, section: 0)
            self.collectionView.scrollToItem(at: initialIndex, at: .right, animated: false)
            currentItem = 1
        }
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
        if movies!.count <= 0 {
            return 0
        }else if movies!.count < 5 {
            return movies!.count
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
