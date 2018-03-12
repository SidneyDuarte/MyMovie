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
    var homeTableModel = HomeTableViewModel()
    let sections: Int = 5
    var loadView = ActivityView()
    var genre: Genre?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getMovies()
    }

    func getMovies() {
        self.configureView()
        
        self.homeTableModel.getMovies(completionHandler: { (sucess) in
            self.tableView.reloadData()
            self.loadView.activityIndicator.stopAnimating()
            self.loadView.removeFromSuperview()
        })
    }
    
    func configureView(){
        self.loadView = Bundle.main.loadNibNamed("LoadView", owner: self, options: nil)![0] as! ActivityView
        self.loadView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        UIApplication.shared.keyWindow?.addSubview(loadView)
    }
}

// MARK: - Table view data source

extension HomeTableViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeTableModel.getNumberOfRowsInSection(section: section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.homeTableModel.configureCells(tableView: tableView, indexPath: indexPath, delegate: self)
        cell.selectionStyle = .none
        return cell
    }
}

// MARK: - Table view delegate

extension HomeTableViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = self.homeTableModel.getHeightForRow(indexPath: indexPath)
        return height
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

// MARK: - Navigation

extension HomeTableViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        self.homeTableModel.configureNavigation(segue: segue, viewController: self, sender: sender)
    }
}

// MARK: - Genre delegate

extension HomeTableViewController: GenreDelegate {
    func getGenre(genre: Genre) {
        self.genre = genre
        let urlString = "\(Constants.UrlConstants.filterByGenreUrl)\(genre.id!)"
        self.performSegue(withIdentifier: "movieListSegue", sender: urlString)
    }
}

// MARK: - Movie delegate

extension HomeTableViewController: MovieDelegate {
    func getMovie(movie: Movie) {
        let movie = movie
        self.performSegue(withIdentifier: "detailMovieByCathalogSegue", sender: movie)
    }
    
    func getUrl(urlString: String) {
        let url = urlString
        self.performSegue(withIdentifier: "movieListSegue", sender: url)
    }
}
