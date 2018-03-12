//
//  MainMoviesCell.swift
//  MyMovie
//
//  Created by Sidney Silva on 10/03/2018.
//  Copyright © 2018 Sakura Soft. All rights reserved.
//

import UIKit

class MainMoviesCellViewMOdel: NSObject {
    var currentItem: Int = 1
    
    func getNumberOfItensInSection(movies: [Movie]) -> Int {
        if movies.count <= 0 {
            return 0
        }else if movies.count < 5 {
            return movies.count
        }
        return 5
    }
    
    func configureScrollCell(collectionView: UICollectionView) {
        let indexPath = IndexPath(item: self.currentItem, section: 0)
        
        if self.currentItem < collectionView.numberOfItems(inSection: 0) {
            collectionView.scrollToItem(at: indexPath, at: .right, animated: true)
            
            currentItem += 1
        } else {
            let initialIndex = IndexPath(item: 0, section: 0)
            collectionView.scrollToItem(at: initialIndex, at: .right, animated: false)
            currentItem = 1
        }
    }
}
