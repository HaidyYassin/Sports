//
//  TeamDetailsViewController.swift
//  Sports App
//
//  Created by Mac on 30/05/2023.
//

import UIKit
import Kingfisher

class TeamDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var teamImage: UIImageView!
    @IBOutlet weak var teamName: UILabel!
    @IBOutlet weak var teamTable: UITableView!
    
    var teamDetails:TeamResult?
    private var viewModel : TeamDetailsViewModel!
    var teamKey : Int!
    var teamPhoto:String = ""
    var teamTitle:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel = TeamDetailsViewModel(myNetwork: NetworkService())
        viewModel.getTeamDetails(teamKey: teamKey)
        
        viewModel.bindTeamDetailsResult = { [weak self] in
            self?.teamDetails = self?.viewModel.detailsResult[0]
            print("teamkey: \(self?.teamDetails?.teamKey)")
            DispatchQueue.main.async { [self] in
                self?.teamTable.reloadData()
            }
            
        }
        
        teamName.text = teamTitle
        KF.url(URL(string:teamPhoto))
          .placeholder(UIImage(named: "lg.png"))
          .set(to: (teamImage)!)
        
    }
    
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch(section){
        case 0:
            return teamDetails?.coaches?.count ?? 0
        case 1:
            return teamDetails?.players?.count ?? 0
        default:
            break
        }
        
        return 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "teamCell") as! TeamMemberCell
        
        cell.memberName.text = teamDetails?.players?[indexPath.row].playerName ?? ""
        
        
        KF.url(URL(string:teamDetails?.players?[indexPath.row].playerImage ?? ""))
          .placeholder(UIImage(named: "lg.png"))
          .set(to: (cell.memberImage))
        
               cell.memberRole.text = teamDetails?.players?[indexPath.row].playerType?.rawValue
        
        return cell ?? UITableViewCell() 
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
            
            let label = UILabel()
            label.frame = CGRect.init(x: 5, y: 5, width: headerView.frame.width-10, height: headerView.frame.height-10)
        switch(section){
        case 0 :
            label.text = "Coaches"
        default:
            label.text = "Players"
        }
            label.font = .systemFont(ofSize: 18)
            label.textColor = .darkGray
            
            headerView.addSubview(label)
            
            return headerView
        }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    
   

}
