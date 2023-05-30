//
//  ViewModel.swift
//  Sports App
//
//  Created by Mac on 30/05/2023.
//

import Foundation
import CoreData

class FavViewModel{
    
    private var myDBMgr: FavDBManager
    init(myDBMgr: FavDBManager) {
        self.myDBMgr = myDBMgr
    }
    
    func getAllFavLeagues() -> [NSManagedObject]{
        myDBMgr.getAllStoredLeagues()
    }
    
    func deleteLeague(league:NSManagedObject){
        myDBMgr.deleteLeague(league: league)
    }
}
