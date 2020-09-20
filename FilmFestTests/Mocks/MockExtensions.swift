//
//  MockExtensions.swift
//  FilmFest
//
//  Created by Mdo on 15/09/2020.
//  Copyright © 2020 Mdo. All rights reserved.
//

import Foundation
import UIKit

@testable import FilmFest
extension MovieLibraryDataServiceTests{
    
    
    class TableViewMock: UITableView{
        
        var cellDequeuedProperly = false
        
        
        // for dependency injection
        class func initMock(dataSource: MovieLibraryDataService)->TableViewMock{
            
            let mock = TableViewMock(frame: CGRect(x: 0, y: 0, width: 300, height: 600), style: .plain)
            mock.dataSource = dataSource
            //
            mock.register(MovieCellMock.self, forCellReuseIdentifier: "movieCellId")
            return mock
        }
        
        override func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell {
            cellDequeuedProperly = true
            
            return super.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        }
    }
    
    class MovieCellMock: MovieCell {
        
        var movieData:Movie?
        
        override func config(movie:Movie){
            
            self.movieData = movie
        }
    }
}
extension MovieCellTests{
    
    class MockCellDataSource: NSObject, UITableViewDataSource {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            1
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            UITableViewCell()
        }
        
        
    }
}
