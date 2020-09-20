//
//  ViewController.swift
//  FilmFest
//
//  Created by Mdo on 10/09/2020.
//  Copyright © 2020 Mdo. All rights reserved.
//

import UIKit

class LibraryViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var dataService: MovieLibraryDataService!
    var movieManager = MovieManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self.dataService
        tableView.delegate = self.dataService
        dataService.movieManager = movieManager
        tableView.register(MovieCell.self, forCellReuseIdentifier: "movieCellId")
        
        movieManager.addMovie(movie: Movie(title: "Goal", releaseDate: "2009"))
        movieManager.addMovie(movie: Movie(title: "Avangers", releaseDate: "2019"))
        movieManager.addMovie(movie: Movie(title: "The Lock Down", releaseDate: "2020"))
            movieManager.addMovie(movie: Movie(title: "Action", releaseDate: "2005"))
        tableView.reloadData()
        
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    

    
    //MARK: - uitableView helper methods
    
    //MAKR : - tableView DataSource methods

}

