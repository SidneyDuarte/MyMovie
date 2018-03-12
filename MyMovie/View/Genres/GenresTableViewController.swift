//
//  GenresTableViewController.swift
//  MyMovie
//
//  Created by Sidney Silva on 11/03/2018.
//  Copyright © 2018 Sakura Soft. All rights reserved.
//

import UIKit

class GenresTableViewController: UITableViewController {
    var genres = [Genre]()
    var delegate: GenreDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getGenres()
    }
    
    func getGenres(){
        ApiProvider.getGenre { (genres) in
            self.genres = genres
            self.tableView.reloadData()
        }
    }

    @IBAction func tapCancellButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

// MARK: - Table view data source

extension GenresTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.genres.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "genreCell", for: indexPath) as! GenreTableViewCell
        let genre = self.genres[indexPath.row]
        cell.lblGenre.text = genre.genreName!
        return cell
    }
}

// MARK: - Table view delegate

extension GenresTableViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.dismiss(animated: true, completion: nil)
        self.delegate?.getGenre(genre: genres[indexPath.row])
    }
}
