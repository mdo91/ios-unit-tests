//
//  ViewController.swift
//  FilmFest
//
//  Created by Mdo on 10/09/2020.
//  Copyright © 2020 Mdo. All rights reserved.
//

import UIKit

class LibraryViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var dataService: MovieLibraryDataService!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self.dataService
        tableView.delegate = self.dataService
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    

    
    //MARK: - uitableView helper methods
    
    //MAKR : - tableView DataSource methods

}

