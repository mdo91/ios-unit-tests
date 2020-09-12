//
//  LibraryViewControllerTests.swift
//  FilmFestTests
//
//  Created by Mdo on 12/09/2020.
//  Copyright © 2020 Mdo. All rights reserved.
//

import XCTest

@testable import FilmFest
class LibraryViewControllerTests: XCTestCase {
    
    var sut: LibraryViewController!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class. libraryViewControllerId
       // sut = LibraryViewController(nibName: "LibraryViewController", bundle: nil)
        sut = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "libraryViewControllerId") as! LibraryViewController
        _ = sut.view
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    //todo check nills

   //MARK: Nill Checks
    
    func testLibraryVC_TableViewShouldNotBeNil(){
        
        XCTAssertNotNil(sut.tableView)
        
    }
    //MARK: DataSource
    func testDataSource_ViewDidLoad_SetsTableViewDataSource(){
        
        XCTAssertNotNil(sut.tableView.dataSource)
        
        XCTAssertTrue(sut.tableView.dataSource is MovieLibraryDataService)
    }
    //MARK: Delegate
    
    func testDelegate_ViewDidLoad_SetsTableViewDelegate(){
        
        XCTAssertNotNil(sut.tableView.delegate)
        
        XCTAssertTrue(sut.tableView.delegate is MovieLibraryDataService)
    }
    
    //MARK: Data Service Assumptions
    
    func testDataService_ViewDidLoad_SingleDataServiceObject(){
        
        XCTAssertEqual(sut.tableView.dataSource as! MovieLibraryDataService, sut.tableView.delegate as! MovieLibraryDataService)
        
    }

}
