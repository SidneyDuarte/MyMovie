//
//  HomeTableViewController.swift
//  MyMovie
//
//  Created by Sidney Silva on 10/03/2018.
//  Copyright © 2018 Sakura Soft. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {
    
    var wathingNowMovies = [Movie]()
    var upcomingMovies = [Movie]()
    var topRatedMovies = [Movie]()
    var popularMovies = [Movie]()
    var homeTableModel: HomeTableViewModel?
    let sections: Int = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.homeTableModel = HomeTableViewModel(delegate: self)
        self.getMovies()
    }

    func getMovies() {
        let loadView: ActivityView = Bundle.main.loadNibNamed("LoadView", owner: self, options: nil)![0] as! ActivityView
        loadView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        self.view.addSubview(loadView)
        view.bringSubview(toFront: self.view)
        
        self.homeTableModel?.getMovies(completionHandler: { (sucess) in
            self.tableView.reloadData()
            loadView.activityIndicator.stopAnimating()
            loadView.removeFromSuperview()
        })
    }
}

// MARK: - Table view data source

extension HomeTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "mainMoviesCell", for: indexPath) as! MainMoviesTableViewCell
            cell.getMovie(movies: self.wathingNowMovies)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "homeMoviesCell", for: indexPath) as! HomeMoviesTableViewCell
            
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath)
            return cell
        }
    }
}

extension HomeTableViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 160
        }
        
        return 0
    }
}

extension HomeTableViewController: HomeDelegate {
    func getTopRatingMovies(movies: [Movie]) {
        self.topRatedMovies = movies
    }
    
    func getPopularMovies(movies: [Movie]) {
        self.popularMovies = movies
    }
    
    func getUpcomingMovies(movies: [Movie]) {
        self.upcomingMovies = movies
    }
    
    func getNowPlayingMovies(movies: [Movie]) {
        self.wathingNowMovies = movies
    }
    
    func getError(error: String) {
        
    }
}
