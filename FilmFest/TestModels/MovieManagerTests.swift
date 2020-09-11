//
//  MovieManagerTests.swift
//  FilmFestTests
//
//  Created by Mdo on 11/09/2020.
//  Copyright © 2020 Mdo. All rights reserved.
//

import XCTest

@testable import FilmFest
class MovieManagerTests: XCTestCase {
    
    var sut : MovieManager!
    
    let scifiMovie = Movie(title: "Si-Fi")
    let arthouseMovie = Movie(title: "Arthouse Drama")
    let actionMovie = Movie(title: "Action/Adventure")

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        sut = MovieManager()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    override class func setUp() {
        super.setUp()
        
        
    }
    
    override func tearDown() {
        super.tearDown()
    }

  
    //MARK: - initial Values
    func testInit_MoviesToSee_RetrunsZero(){
        
        //let sut = MovieManager()
        XCTAssertEqual(sut.moviesToSeeCount, 0)
    }
    
    func testInit_MoviesSeen_ReturnsZero(){
        
       // let sut = MovieManager()
        
        XCTAssertEqual(sut.moviesSeenCount, 0)
    }
    
    //MARK: - Add & Query
    
    func testAdd_MoviesToSee_ReturnsOne(){
       // let testMovie = Movie(title: "Avengers")
        //sut.moviesToSeeCount = 1
        sut.addMovie(movie:scifiMovie)
        
        XCTAssertEqual(sut.moviesToSeeCount, 1)
    }
    
    func testQuery_ReturnsMovieAtIndex(){
        
     //   let testMovie = Movie(title: "Terminator")
        
        sut.addMovie(movie: arthouseMovie)
        let queridMovie = sut.movieAtIndex(index: 0)
        
        XCTAssertEqual(arthouseMovie.title, queridMovie.title)
    }
    
    func testCheckOffMovie_UpdatesMovieManagerCount(){
        
 
        sut.addMovie(movie: actionMovie)
        
        sut.checkOffMovieAtIndex(index: 0)
        
        XCTAssertEqual(sut.moviesSeenCount, 1)
        XCTAssertEqual(sut.moviesToSeeCount, 0)
        
    }
    
    func testCheckOffMovie_RemovesMovieFromArray(){
        
        sut.addMovie(movie: scifiMovie)
        sut.addMovie(movie: arthouseMovie)
        
        sut.checkOffMovieAtIndex(index: 0)
        
        XCTAssertEqual(sut.movieAtIndex(index: 0).title,arthouseMovie.title )
        
        
    }
    
    func testCheckOffMovie_ReturnsMovieAtIndex(){
        
        sut.addMovie(movie: scifiMovie)
        
        sut.checkOffMovieAtIndex(index: 0)
        
        let movieQueried = sut.checkedOffMovieAtIndex(index:0)
        
        XCTAssertEqual(scifiMovie.title, movieQueried.title)
    }
    

    
}
