//
//  LeaguesTableView.swift
//  Sports App
//
//  Created by Mac on 20/05/2023.
//

import UIKit
import Kingfisher

//b7cec958d99cadc1a45d46998255a420e8ed1b99653755908b46ae0dd017b9d8

class LeaguesTableView: UITableViewController {

   
    private let footballUrl = "https://apiv2.allsportsapi.com/football/?met=Leagues&APIkey=b7cec958d99cadc1a45d46998255a420e8ed1b99653755908b46ae0dd017b9d8"
    private let basketballUrl = "https://apiv2.allsportsapi.com/basketball/?met=Leagues&APIkey=b7cec958d99cadc1a45d46998255a420e8ed1b99653755908b46ae0dd017b9d8"
    private let cricketUrl = "https://apiv2.allsportsapi.com/cricket/?met=Leagues&APIkey=b7cec958d99cadc1a45d46998255a420e8ed1b99653755908b46ae0dd017b9d8"
    private let tennisUrl = "https://apiv2.allsportsapi.com/tennis/?met=Leagues&APIkey=b7cec958d99cadc1a45d46998255a420e8ed1b99653755908b46ae0dd017b9d8"
    
    var LeagueType : String = ""
    var viewModel:LeaguesViewModel!
    var leaguesList : [Result]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        leaguesList = []
        
        navigationItem.title = "Leagues"
    
        viewModel = LeaguesViewModel(myNetwork: NetworkService())
        
        let nib = UINib(nibName: "LeaguesTableCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "leaguesCell")
        //tableView.layer.cornerRadius = 100
        print("type: \(LeagueType)")
        
        switch(LeagueType){
        case "Football":
            viewModel.getLeaguesOverNetwork(url: footballUrl)
        case "Basketball":
            viewModel.getLeaguesOverNetwork(url: basketballUrl)
        case "Cricket":
            viewModel.getLeaguesOverNetwork(url: cricketUrl)
        case "Tennis":
            viewModel.getLeaguesOverNetwork(url: tennisUrl)
        default:
            break
        }
        
        viewModel.bindFootballResult = { [weak self] in
            self?.leaguesList = self!.viewModel.myresult
            DispatchQueue.main.async { [self] in
                self?.tableView.reloadData()
            }
           
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
     
        self.tableView.reloadData()
       
    }

    

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return leaguesList?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "leaguesCell", for: indexPath) as! LeaguesTableCell

        // Configure the cell...
        cell.layer.cornerRadius = 190
        cell.leagueName.text = leaguesList![indexPath.row].leagueName
        
        KF.url(URL(string: leaguesList![indexPath.row].leagueLogo ?? ""))
          .placeholder(UIImage(named: "lg.png"))
          .set(to: cell.leagueImg)
        
        cell.leagueImg.layer.cornerRadius = cell.leagueImg.frame.size.width / 2
        cell.leagueImg.clipsToBounds = true
        

        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    


}
