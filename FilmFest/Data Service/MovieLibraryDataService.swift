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
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCellId", for: indexPath) as! MovieCell
        
        return cell
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 2
    }
    
    
}
