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
        let cell = self.homeTableModel.configureCells(tableView: tableView, indexPath: indexPath)
        return cell
    }
}

// MARK: - Table view delegate

extension HomeTableViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 260
        }else if indexPath.section == 1 {
            return 250
        }
        
        return 0
        
    }
}
