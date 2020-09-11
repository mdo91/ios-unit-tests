//
//  Movie.swift
//  FilmFest
//
//  Created by Mdo on 10/09/2020.
//  Copyright © 2020 Mdo. All rights reserved.
//

import Foundation

struct Movie:Equatable {
    var title:String
    var releaseDate:String?
//    var moviesToSee : [Movie] = []
    
    init(title:String, releaseDate:String? = nil) {
        self.title = title
        self.releaseDate = releaseDate
        
    }
    
    static func ==(lhs:Movie,rhs:Movie) -> Bool{
        
        if lhs.title != rhs.title{
            
            return false
        }
        
        if lhs.releaseDate != rhs.releaseDate {
            
            return false
        }
        
        return true
    }
}
