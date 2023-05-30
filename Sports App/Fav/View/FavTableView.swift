//
//  FavTableView.swift
//  Sports App
//
//  Created by Mac on 20/05/2023.
//

import UIKit
import CoreData
import Kingfisher

class FavTableView: UITableViewController {

    var favList:[NSManagedObject] = []
    var viewModel : FavViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "LeaguesTableCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "leaguesCell")
        
        viewModel = FavViewModel(myDBMgr: FavDBManager.FavDBInstance)
    }

    override func viewWillAppear(_ animated: Bool) {
        favList = []
        favList = viewModel.getAllFavLeagues()
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return 0
    }
    
   

}
