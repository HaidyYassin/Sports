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
    var LeagueType : String = ""
    var legId:Int!
    var legName:String!
    var currentObj : LeagueResult!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "LeaguesTableCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "leaguesCell")
        
        viewModel = FavViewModel(myDBMgr: FavDBManager.FavDBInstance)
    }

    override func viewWillAppear(_ animated: Bool) {
        favList = []
        favList = viewModel.getAllFavLeagues()
        tableView.reloadData()
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return favList.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "leaguesCell", for: indexPath) as! LeaguesTableCell
        
        cell.layer.cornerRadius = 190
        cell.leagueName.text = favList[indexPath.row].value(forKey: "leagueName") as! String
        
    
        KF.url(URL(string: (favList[indexPath.row].value(forKey: "leagueLogo") as? String) ?? "" ))
          .placeholder(UIImage(named: "lg.png"))
          .set(to: cell.leagueImg)
        
        cell.leagueImg.layer.cornerRadius = cell.leagueImg.frame.size.width / 2
        cell.leagueImg.clipsToBounds = true
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
   

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {

            //viewModel.deleteLeague(league: favList[indexPath.row])
            self.present(viewModel.DeleteAlert(league: favList[indexPath.row]), animated: true, completion: nil)
            favList.remove(at: indexPath.row)
            tableView.reloadData()
            
            do{
                try FavDBManager.managedContext.save()
            }catch let error as NSError{
                print(error)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if(checkReachability()){
            
            legId = (favList[indexPath.row].value(forKey: "leagueKey")) as! Int
            legName = (favList[indexPath.row].value(forKey: "leagueName")) as! String
            //currentObj = (favList[indexPath.row])
            LeagueType = (favList[indexPath.row].value(forKey: "type")) as! String
            self.performSegue(withIdentifier: "navToDetails", sender: nil)
        }else{
            self.present(viewModel.showAlert(), animated: true, completion: nil)
        }
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "navToDetails" {
            let controller = segue.destination as! DetailsCollection
            controller.LeagueType = LeagueType
            controller.leagueKey = legId
            controller.leagueName = legName
            controller.leagueObj = currentObj
           }
    }
    
}
