//
//  MovieCell.swift
//  FilmFest
//
//  Created by Mdo on 14/09/2020.
//  Copyright © 2020 Mdo. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    
  //  var movie: Movie?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        
    }
    
    func config(movie:Movie){
        self.textLabel?.text = movie.title
        self.detailTextLabel?.text = movie.releaseDate
       // print("self.detailTextLabel?.text \(self.detailTextLabel?.text)")
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
