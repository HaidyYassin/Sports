//
//  FavDB.swift
//  Sports App
//
//  Created by Mac on 21/05/2023.
//

import Foundation
import CoreData
import UIKit

class FavDBManager {
    
    private static let appDelegate = UIApplication.shared.delegate as? AppDelegate
     static let managedContext = appDelegate!.persistentContainer.viewContext
    private static let entity = NSEntityDescription.entity(forEntityName: "League", in: managedContext)
    
    private init(){
        
    }
    
    public static let FavDBInstance = FavDBManager()
    

     func insertLeague(League:LeagueResult){
         let myLeague = NSManagedObject(entity: FavDBManager.entity!, insertInto: FavDBManager.managedContext)
         
         myLeague.setValue(League.leagueName, forKey: "leagueName")
         myLeague.setValue(League.leagueLogo, forKey: "leagueLogo")
         myLeague.setValue(League.leagueKey, forKey: "leagueKey")
         myLeague.setValue(League.countryName, forKey: "countryName")
         myLeague.setValue(League.countryLogo, forKey: "countryLogo")
         myLeague.setValue(League.countryKey, forKey: "countryKey")
         
       /*  myLeague.setValue(League.value(forKey: "leagueName"), forKey: "leagueName")
         myLeague.setValue(League.value(forKey: "leagueLogo"), forKey: "leagueLogo")
         myLeague.setValue(League.value(forKey: "leagueKey"), forKey: "leagueKey")
         myLeague.setValue(League.value(forKey: "countryName"), forKey: "countryName")
         myLeague.setValue(League.value(forKey: "countryLogo"), forKey: "countryLogo")
         myLeague.setValue(League.value(forKey: "countryKey"), forKey: "countryKey")*/
       
    do{
        try FavDBManager.managedContext.save()
        print("Added to Fav")
    }catch let error as NSError{
        print(error.localizedDescription)
    }
}

    
    func getAllStoredLeagues() -> [NSManagedObject]{
        var leaguesList:[NSManagedObject] = []
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "League")
        do{
            leaguesList = try FavDBManager.managedContext.fetch(fetchRequest)
        }catch let error as NSError{
            print(error.localizedDescription)
        }
        
        return leaguesList
    }
    
    func deleteLeague(league:NSManagedObject){
        
        FavDBManager.managedContext.delete(league)
        print("removed from fav")
        
        do{
            try FavDBManager.managedContext.save()
        }catch let error as NSError{
            print(error)
        }
        
    }
    
}
