//
//  MoiveStructTests.swift
//  FilmFestTests
//
//  Created by Mdo on 10/09/2020.
//  Copyright © 2020 Mdo. All rights reserved.
//

import XCTest

@testable import FilmFest
class MoiveStructTests: XCTestCase {
    
    
    
    override class func setUp() {
        super.setUp()
    }
    
    override class func tearDown() {
        super.tearDown()
    }

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    //MARK: - initialization
    func testInit_MovieWithTitle(){
        
        let testMovie = Movie(title:"Generic Blockbuster")
        
        XCTAssertNotNil(testMovie)
        XCTAssertEqual(testMovie.title, "Generic Blockbuster")
    }
    
    func testInit_WithReleaseDateAndTitle(){
        
        let testMovie = Movie(title: "The Spy", releaseDate:"1992")
        
        XCTAssertNotNil(testMovie)
        XCTAssertEqual(testMovie.releaseDate, "1992")
        
    }
    //MARK: - Equatable
    func testEquatable_returnsTrue(){
         let actionMovie =  Movie(title: "ACTION")
        let actionMovie2 = Movie(title: "ACTION")
        
        XCTAssertEqual(actionMovie, actionMovie2)
        
    }
    
    func testEquatable_ReturnsFalseForDifferentMovieTitles(){
        
         let actionMovie =  Movie(title: "ACTION")
        let actionMovie2 = Movie(title: "Si-Fi")
        
        XCTAssertNotEqual(actionMovie, actionMovie2)
        
        
    }
    
    func testEquatable_RetrunsNotEqualForDifferentReleaseDates(){
          
          let testMovie1 = Movie(title: "action", releaseDate: "1992")
          let testMovie2 = Movie(title: "action", releaseDate: "2008")
          
        XCTAssertNotEqual(testMovie1, testMovie2)
          
      }
    




}
