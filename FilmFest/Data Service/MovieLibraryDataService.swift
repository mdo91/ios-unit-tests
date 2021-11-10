//
//  MovieLibraryDataService.swift
//  FilmFest
//
//  Created by Mdo on 12/09/2020.
//  Copyright © 2020 Mdo. All rights reserved.
//

import Foundation
import UIKit

enum LibrarySection: Int{
    
    case MoviesToSee,MoviesSeen
}
class MovieLibraryDataService: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    var movieManager:MovieManager?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let movieManager = movieManager else { return 0}
        
        guard let librarySection = LibrarySection(rawValue: section) else{ fatalError() }
        
        switch librarySection {
        case .MoviesToSee:
            return movieManager.moviesToSeeCount
        case .MoviesSeen:
            return movieManager.moviesSeenCount
        }

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
       guard let movieManager = movieManager else { fatalError()}
        
       guard let LibrarySection = LibrarySection(rawValue: indexPath.section) else { fatalError() }
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCellId", for: indexPath) as! MovieCell
        
        let movieData = LibrarySection.rawValue == 0 ? movieManager.movieAtIndex(index: indexPath.row) : movieManager.checkedOffMovieAtIndex(index: indexPath.row)
        
            cell.config(movie: movieData)
        
        return cell
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let movieManager = movieManager else{ fatalError()}
        guard let librarySection = LibrarySection(rawValue: indexPath.row) else{return}
        if librarySection == .MoviesToSee {
            
            movieManager.checkOffMovieAtIndex(index: indexPath.row)
            tableView.reloadData()
            
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
       // guard let movieManager = movieManager else{ fatalError()}
        guard let librarySection = LibrarySection(rawValue: section) else{ fatalError()}
        if librarySection == .MoviesToSee {
            
            return "Movies To See"
            
        }else{
            
            return "Seen Movies"
        }
        
    }
    
    
}
