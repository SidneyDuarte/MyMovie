//
//  HomeTableViewModel.swift
//  MyMovie
//
//  Created by Sidney Silva on 10/03/2018.
//  Copyright © 2018 Sakura Soft. All rights reserved.
//

import UIKit

class HomeTableViewModel: NSObject {
    
    var wathingNowMovies = [Movie]()
    var upcomingMovies = [Movie]()
    var topRatedMovies = [Movie]()
    var popularMovies = [Movie]()

    func getMovies(completionHandler: @escaping (_ : Bool) -> ()){
        ApiProvider.getMovie(withURLString: Constants.UrlConstants.nowPlayingUrl, andCompletionHandler: { (movies, totalPages, currentPage) in
            self.wathingNowMovies = movies
            
            ApiProvider.getMovie(withURLString: Constants.UrlConstants.popularUrl, andCompletionHandler: { (movies, totalPages, currentPage) in
                self.popularMovies = movies
                
                ApiProvider.getMovie(withURLString: Constants.UrlConstants.topRatedMovies, andCompletionHandler: { (movies, totalPages, currentPage) in
                    self.topRatedMovies = movies
                    
                    ApiProvider.getMovie(withURLString: Constants.UrlConstants.upcomingMovies, andCompletionHandler: { (movies, totalPages, currentPage) in
                        self.upcomingMovies = movies
                        completionHandler(true)
                    })
                })
            })
        })
    }
    
    func getNumberOfRowsInSection(section: Int) -> Int{
        switch section {
        case 0:
            return 1
        case 1:
            return 3
        default:
            return 0
        }
    }
    
    func getHeightForRow(indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 260
        case 1:
            return 250
        default:
            return 0
        }
    }
    
    func configureCells(tableView: UITableView, indexPath: IndexPath, delegate: Any) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = self.configureMainMovieCell(tableView: tableView, indexPath: indexPath)
            cell.delegate = delegate as? MovieDelegate
            return cell
        case 1:
            let cell = self.configureCategoryMovieCell(tableView: tableView, indexPath: indexPath)
            cell.delegate = delegate as? MovieDelegate
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "Defualt", for: indexPath)
            return cell
        }
    }
    
    private func configureMainMovieCell(tableView: UITableView, indexPath: IndexPath) -> MainMoviesTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainMoviesCell", for: indexPath) as! MainMoviesTableViewCell
        cell.getMovie(movies: self.wathingNowMovies)
        return cell
    }
    
    private func configureCategoryMovieCell(tableView: UITableView, indexPath: IndexPath) -> HomeMoviesTableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeMoviesCell", for: indexPath) as! HomeMoviesTableViewCell
        switch indexPath.row {
        case 0:
            cell.getMovie(movies: self.popularMovies)
            cell.title.text = "popular"
            cell.viewAllButton.tag = indexPath.row
            break
        case 1:
            cell.getMovie(movies: self.topRatedMovies)
            cell.title.text = "top rated"
            cell.viewAllButton.tag = indexPath.row
            break
        case 2:
            cell.getMovie(movies: self.upcomingMovies)
            cell.title.text = "upcoming"
            cell.viewAllButton.tag = indexPath.row
            break
        default:
            break
        }
        return cell
    }
    
    func configureNavigation(segue: UIStoryboardSegue, viewController: UIViewController, sender: Any?) {
        if segue.identifier == "genreSegue" {
            let genreView = segue.destination as? GenresTableViewController
            genreView?.delegate = viewController as? GenreDelegate
        }else if segue.identifier == "movieListSegue" {
            let movieList = segue.destination as? MovieListTableViewController
            movieList?.stringUrl = sender as! String
        }else if segue.identifier == "detailMovieByCathalogSegue" {
            let movieDetail = segue.destination as? MovieDetailTableViewController
            movieDetail?.movie = sender as? Movie
        }
    }
}
