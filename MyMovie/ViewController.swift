//
//  ViewController.swift
//  MyMovie
//
//  Created by Sidney Silva on 10/03/2018.
//  Copyright © 2018 Sakura Soft. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var wathingNowMovies = [Movie]()
    var popularMovies = [Movie]()
    var topRatedMovies = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getMovies()
    }

    func getMovies() {
        
//        self.homeTableModel?.getMovies(completionHandler: { (sucess) in
//            view.activityIndicator.stopAnimating()
//            view.removeFromSuperview()
//        })
    }
}

