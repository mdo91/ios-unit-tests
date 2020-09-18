//
//  MovieCellTests.swift
//  FilmFestTests
//
//  Created by Mdo on 17/09/2020.
//  Copyright © 2020 Mdo. All rights reserved.
//

import XCTest
@testable import FilmFest
class MovieCellTests: XCTestCase {
    
    var tableView:UITableView!
    var mockDataSource: MockCellDataSource!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
//        let libraryVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "libraryViewControllerId") as! LibraryViewController
//
//        _ = libraryVC.view
//
//        tableView = libraryVC.tableView
//       // tableView.dataSource = libraryVC.dataService
//
//        mockDataSource = MockCellDataSource()
//        tableView.dataSource = mockDataSource
        
        let libraryVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "libraryViewControllerId") as! LibraryViewController
        _ = libraryVC.view
        
        tableView = libraryVC.tableView
        mockDataSource = MockCellDataSource()
        tableView.dataSource = mockDataSource
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCell_Config_ShouldSetLablesToMovieData(){
        
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "movieCellId", for: IndexPath(row: 0, section: 0)) as! MovieCell

        if cell.detailTextLabel?.text == nil {
            cell = MovieCell(style: .subtitle, reuseIdentifier: "movieCellId")
        }
        
        cell.config(movie: Movie(title: "Indie Comedy", releaseDate: "2018"))
        
        XCTAssertEqual(cell.detailTextLabel?.text, "2018")
        XCTAssertEqual(cell.textLabel?.text, "Indie Comedy")
        
        
        
    }

}
