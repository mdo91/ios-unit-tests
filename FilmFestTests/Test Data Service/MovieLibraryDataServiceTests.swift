//
//  MovieLibraryDataServiceTests.swift
//  FilmFestTests
//
//  Created by Mdo on 14/09/2020.
//  Copyright © 2020 Mdo. All rights reserved.
//

import XCTest

@testable import FilmFest
class MovieLibraryDataServiceTests: XCTestCase {
    
    var libraryDataService : MovieLibraryDataService!
    
    var librayTableView : UITableView!
    var tableViewMock: TableViewMock!
    
    var libraryVC: LibraryViewController!
    
    let farMovie = Movie(title: "Fairy Tale")
    let thriller = Movie(title: "Thriller")
    let darkComedy = Movie(title: "Dark Comedy")

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        libraryDataService = MovieLibraryDataService()
        libraryDataService.movieManager = MovieManager()
        tableViewMock = TableViewMock.initMock(dataSource: libraryDataService)
        
        libraryVC = (UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "libraryViewControllerId") as! LibraryViewController)
        _ = libraryVC.view
        
        librayTableView = libraryVC.tableView
        librayTableView.dataSource = libraryDataService
        librayTableView.delegate = libraryDataService
       
        

        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testTableViewSectionCounts_ReturnsTwo(){

        

        
        let sections = librayTableView.numberOfSections
        print("sections num \(sections)")
        XCTAssertEqual(sections, 2)
        
        
    }
    
    func testTableViewSections_SectionOne_ReturnsMovieToSeeCount(){
        
//        libraryDataService.movieManager?.addMovie(movie: thriller)
//        libraryDataService.movieManager?.addMovie(movie: farMovie)
//        
        
//        XCTAssertEqual(librayTableView.numberOfRows(inSection: 0), libraryDataService.movieManager?.moviesToSeeCount
//
//        )
        
//        libraryDataService.movieManager?.addMovie(movie: darkComedy)
//        librayTableView.reloadData()
//
        librayTableView.reloadData()
        XCTAssertEqual(librayTableView.numberOfRows(inSection: 0), libraryDataService.movieManager?.moviesToSeeCount
        
        )
        
        
        
    }
    
    func testTableViweSections_SectionTwo_ReturnsMoviesSeenCount(){
        
        
      //  print("movies seen so far: \(libraryDataService.movieManager?.moviesSeenCount)")
//        
//        libraryDataService.movieManager?.addMovie(movie: darkComedy)
//        libraryDataService.movieManager?.addMovie(movie: thriller)
       // libraryDataService.movieManager?.addMovie(movie: farMovie)
        
     //   print("movies to see: \(libraryDataService.movieManager?.moviesToSeeCount)")
        
//
//        libraryDataService.movieManager?.checkOffMovieAtIndex(index: 0)
//        libraryDataService.movieManager?.checkOffMovieAtIndex(index: 0)
  //      print("movies seen so far: \(libraryDataService.movieManager?.moviesSeenCount)")

        XCTAssertEqual(librayTableView.numberOfRows(inSection: 1), libraryDataService.movieManager?.moviesSeenCount)
    }
    
    func testCell_RawAtIndex_ReturnsMovieCell(){
        
        libraryDataService.movieManager?.addMovie(movie: darkComedy)
        
        //librayTableView.dataSource = libraryDataService
        librayTableView.reloadData()
        
//        librayTableView.register(MovieCell.self, forCellReuseIdentifier: "movieCellId")
        
        let cellQueried = librayTableView.cellForRow(at: IndexPath(row: 0, section: 0))
        
        
        
        XCTAssertTrue(cellQueried is MovieCell)
          
          
          
      }
    
    func testCell_shouldDequeueCell(){
        
        ////replaced by dependency injection
//        let mock = TableViewMock()
//
//        mock.dataSource = libraryDataService
//
//        mock.register(MovieCell.self, forCellReuseIdentifier: "movieCellId")
        
        libraryDataService.movieManager?.addMovie(movie: thriller)
        tableViewMock.reloadData()
        
        _ = tableViewMock.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(tableViewMock.cellDequeuedProperly)
        
    }
    
    func testCell_SectionCellConfig_ShouldSetCellData(){
        
        //replaced by dependency injection
          
//          let mock = TableViewMock()
//
//        mock.dataSource =  libraryDataService
//        mock.register(MovieCellMock.self, forCellReuseIdentifier: "movieCellId")
        
        libraryDataService.movieManager?.addMovie(movie: farMovie)
        tableViewMock.reloadData()
        
        let cell = tableViewMock.cellForRow(at: IndexPath(row: 0, section: 0)) as! MovieCellMock
       // cell.config(movie: farMovie)
        
        
        XCTAssertEqual(cell.movieData, farMovie)
          
          
      }
    
    func testCell_SectionTwoConfig_ShouldSetCellData(){
        
        
        libraryDataService.movieManager?.addMovie(movie: thriller)
        libraryDataService.movieManager?.addMovie(movie: farMovie)
        libraryDataService.movieManager?.checkOffMovieAtIndex(index: 0)
        tableViewMock.reloadData()
        let cell = tableViewMock.cellForRow(at: IndexPath(row: 0, section: 1)) as! MovieCellMock
        
        XCTAssertEqual(cell.movieData, thriller)
    }
    
    func testCell_Selection_ShouldCheckOffSelectedMovie(){
        
        libraryDataService.movieManager?.addMovie(movie: farMovie)
        libraryDataService.movieManager?.addMovie(movie: darkComedy)
        
        librayTableView.delegate?.tableView!(librayTableView, didSelectRowAt: IndexPath(row: 0, section: 0))
        
        XCTAssertEqual(libraryDataService.movieManager?.moviesSeenCount, 1)
        XCTAssertEqual(libraryDataService.movieManager?.moviesToSeeCount, 1)
        XCTAssertEqual(librayTableView.numberOfRows(inSection: 0), 1)
        XCTAssertEqual(librayTableView.numberOfRows(inSection: 1), 1)
        
        
    }
    
    func testTableViewSectionTitles_ShouldHaveCorrectStringValues(){
           
        let sectionTitle1 = librayTableView.dataSource?.tableView?(librayTableView, titleForHeaderInSection: 0)
        
        let sectionTitle2 = librayTableView.dataSource?.tableView?(librayTableView, titleForHeaderInSection: 1)
        
        XCTAssertEqual(sectionTitle1, "Movies To See")
        XCTAssertEqual(sectionTitle2, "Seen Movies")
        
        
       }
    

}

