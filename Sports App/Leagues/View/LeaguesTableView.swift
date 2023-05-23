//
//  LeaguesTableView.swift
//  Sports App
//
//  Created by Mac on 20/05/2023.
//

import UIKit
import Kingfisher



class LeaguesTableView: UITableViewController {

    let indicator = UIActivityIndicatorView(style: .large)
   
    var LeagueType : String = ""
    var viewModel:LeaguesViewModel!
    var leaguesList : [Result]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        leaguesList = []
        indicator.center = self.view.center
        self.view.addSubview(indicator)
        indicator.startAnimating()
        
        navigationItem.title = "Leagues"
    
        viewModel = LeaguesViewModel(myNetwork: NetworkService())
        
        let nib = UINib(nibName: "LeaguesTableCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "leaguesCell")
        //tableView.layer.cornerRadius = 100
        print("type: \(LeagueType)")
        
        switch(LeagueType){
        case "Football":
            viewModel.getLeaguesOverNetwork(url: ApiUrls.footballLeague.rawValue)
        case "Basketball":
            viewModel.getLeaguesOverNetwork(url: ApiUrls.basketballLeague.rawValue)
        case "Cricket":
            viewModel.getLeaguesOverNetwork(url: ApiUrls.cricketLeague.rawValue)
        case "Tennis":
            viewModel.getLeaguesOverNetwork(url: ApiUrls.tennisUrl.rawValue)
        default:
            break
        }
        
        viewModel.bindFootballResult = { [weak self] in
            self?.leaguesList = self!.viewModel.myresult
            DispatchQueue.main.async { [self] in
                self?.indicator.stopAnimating()
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
        

        print("id is\(leaguesList![indexPath.row].leagueKey)")
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "goToDetails", sender: nil)
    }
    


}
