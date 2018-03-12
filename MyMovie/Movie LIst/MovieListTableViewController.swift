//
//  MovieListTableViewController.swift
//  MyMovie
//
//  Created by Sidney Silva on 11/03/2018.
//  Copyright © 2018 Sakura Soft. All rights reserved.
//

import UIKit

class MovieListTableViewController: UITableViewController {
    var movies = [Movie]()
    var stringUrl = String()
    var loadView = ActivityView()
    var totalPages: Int = 0
    var currentPage: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getMovies()
    }
    
    func getMovies(){
        self.configureView()
        ApiProvider.getMovie(withURLString: stringUrl) { (movies, totalPages, currentPage) in
            self.movies = movies
            self.totalPages = totalPages
            self.currentPage = currentPage
            self.loadView.activityIndicator.stopAnimating()
            self.loadView.removeFromSuperview()
            self.tableView.reloadData()
        }
    }
    
    func getMoreMovies(stringUrl: String) {
        ApiProvider.getMovie(withURLString: stringUrl) { (movies, totalPages, currentPage) in
            self.movies.append(contentsOf: movies)
            self.currentPage = currentPage
            self.tableView.reloadData()
        }
    }
    
    func configureView(){
        self.loadView = Bundle.main.loadNibNamed("LoadView", owner: self, options: nil)![0] as! ActivityView
        self.loadView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        UIApplication.shared.keyWindow?.addSubview(loadView)
    }
}

// MARK: - Table view data source

extension MovieListTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! MovieListTableViewCell
        cell.movieImage.image = UIImage(named: "thumb")
        let movie = movies[indexPath.row]
        let posterPath = movie.posterPath
        let urlImage = "http://image.tmdb.org/t/p/w342/" + posterPath!
        cell.movieName.text = movie.title!
        cell.movieYear.text = movie.releaseDate!
        cell.movieRating.text = "rating: \(movie.voteAverange!)"
        cell.movieOverview.text = movie.overView!
        cell.movieImage.getImageUsingNSCache(withUrlString: urlImage)
        return cell
    }
}

// MARK: - Table view delegates

extension MovieListTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = movies[indexPath.row]
        
        self.performSegue(withIdentifier: "detailMovieByListSegue", sender: movie)
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if self.currentPage != self.totalPages && indexPath.row == self.movies.count - 1 {
            let url = self.stringUrl + "&page=\(currentPage + 1)"
            self.getMoreMovies(stringUrl: url)
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 125
    }
}

// MARK: - Navigation

extension MovieListTableViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "detailMovieByListSegue" {
            let detailPage = segue.destination as! MovieDetailTableViewController
            let movie = sender as! Movie
            detailPage.movie = movie
        }
    }
}
