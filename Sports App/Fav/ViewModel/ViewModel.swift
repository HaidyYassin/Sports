//
//  ViewModel.swift
//  Sports App
//
//  Created by Mac on 30/05/2023.
//

import Foundation
import CoreData
import UIKit

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
    
    func showAlert() -> UIAlertController{
        let alert = UIAlertController(title: "Error!", message: "please check your connection and try again later", preferredStyle: UIAlertController.Style.alert)

                alert.addAction(UIAlertAction(title: "OK",
                                              style: UIAlertAction.Style.default,
                                              handler: {(_: UIAlertAction!) in
                                                //Sign out action
                }))
          return alert
    }
    
    
    func DeleteAlert(league:NSManagedObject) ->UIAlertController{
        let alert = UIAlertController(title: "Warning!", message: "Are You Sure You Want to Delete this Item?", preferredStyle: UIAlertController.Style.alert)

                alert.addAction(UIAlertAction(title: "Cancel",
                                              style: UIAlertAction.Style.default,
                                              handler: nil))
        
        alert.addAction(UIAlertAction(title: "Delete",
                                      style: UIAlertAction.Style.destructive,
                                      handler: {(_: UIAlertAction!) in
            self.myDBMgr.deleteLeague(league: league)
        }))
          return alert
    }
}
