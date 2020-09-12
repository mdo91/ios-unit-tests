//
//  MovieManager.swift
//  FilmFest
//
//  Created by Mdo on 11/09/2020.
//  Copyright © 2020 Mdo. All rights reserved.
//

import Foundation

class MovieManager{
    
    var moviesToSeeCount : Int{
        
        return movies.count
    }
    
    var moviesSeenCount : Int{
        return moviesSeenArray.count
    }
    
    var movies : [Movie] = []
    var moviesSeenArray : [Movie] = []
    
    func addMovie(movie: Movie){
        
   //     moviesToSeeCount += 1
        //movieAtIndex
        
        if !movies.contains(movie){
            
             movies.append(movie)
        }
       
         //moviesSeenArray.append(movie)
        
    }
    
    func movieAtIndex(index:Int) -> Movie {
        
        return movies[index]
    }
    
    func checkOffMovieAtIndex(index:Int){
        
        guard index < moviesToSeeCount else { return}
        
      //  moviesSeenCount += 1
      //  moviesToSeeCount -= 1
        moviesSeenArray.append(movies[index])
        movies.remove(at: index)
       
    }
    
    func checkedOffMovieAtIndex(index:Int) -> Movie{
       // guard index < moviesSeenCount else {  return }
        return moviesSeenArray[index]
    }
    
    func clearArrays(){
        
        movies.removeAll()
        moviesSeenArray.removeAll()
        
    }
}
