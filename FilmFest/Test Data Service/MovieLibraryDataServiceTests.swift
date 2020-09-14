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
    
    var libraryVC: LibraryViewController!
    
    let farMovie = Movie(title: "Fairy Tale")
    let thriller = Movie(title: "Thriller")
    let darkComedy = Movie(title: "Dark Comedy")

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        libraryDataService = MovieLibraryDataService()
        libraryDataService.movieManager = MovieManager()
        
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
        
        libraryDataService.movieManager?.addMovie(movie: thriller)
        libraryDataService.movieManager?.addMovie(movie: farMovie)
        
        
        XCTAssertEqual(librayTableView.numberOfRows(inSection: 0), libraryDataService.movieManager?.moviesToSeeCount
        
        )
        
        libraryDataService.movieManager?.addMovie(movie: darkComedy)
        librayTableView.reloadData()
        
        
        XCTAssertEqual(librayTableView.numberOfRows(inSection: 0), libraryDataService.movieManager?.moviesToSeeCount
        
        )
        
        
        
    }
    
    func testTableViweSections_SectionTwo_ReturnsMoviesSeenCount(){
        
        
      //  print("movies seen so far: \(libraryDataService.movieManager?.moviesSeenCount)")
        
        libraryDataService.movieManager?.addMovie(movie: darkComedy)
        libraryDataService.movieManager?.addMovie(movie: thriller)
       // libraryDataService.movieManager?.addMovie(movie: farMovie)
        
     //   print("movies to see: \(libraryDataService.movieManager?.moviesToSeeCount)")
        
        
        libraryDataService.movieManager?.checkOffMovieAtIndex(index: 0)
        libraryDataService.movieManager?.checkOffMovieAtIndex(index: 0)
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
        
        let mock = TableViewMock()
        
        mock.dataSource = libraryDataService
        
        mock.register(MovieCell.self, forCellReuseIdentifier: "movieCellId")
        
        libraryDataService.movieManager?.addMovie(movie: thriller)
        mock.reloadData()
        
        _ = mock.cellForRow(at: IndexPath(row: 0, section: 0))
        XCTAssertTrue(mock.cellDequeuedProperly)
        
    }
    

}
extension MovieLibraryDataServiceTests{
    
    
    class TableViewMock: UITableView{
        
        var cellDequeuedProperly = false
        
        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            cellDequeuedProperly = true
            
            return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
    }
}
