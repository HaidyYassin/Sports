//
//  DetailsCollection.swift
//  Sports App
//
//  Created by Mac on 22/05/2023.
//

import UIKit
import Kingfisher
import CoreData

class DetailsCollection: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var upcomingEventsList:[UpcomingEvent] = []
    var latestEventsList:[UpcomingEvent] = []
    var teamsList:[TeamResult] = []
    var LeagueType : String = ""
    var leagueKey : Int!
    var leagueName: String!
    var leagueObj : LeagueResult!
    var leagueNSManagedObj : NSManagedObject!
   
    var viewModel:LeaguesDetailsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = LeaguesDetailsViewModel(myNetwork: NetworkService(),myDBMgr: FavDBManager.FavDBInstance)
        
        self.navigationItem.title = leagueName
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "heart"), style: .plain, target: self, action: #selector(addToFav))
        
        let layout = UICollectionViewCompositionalLayout {sectionIndex,enviroment in
            switch sectionIndex {
            case 0 :
                return self.upcomingSection()
            case 1:
                return self.LatestSection()
            default:
                return self.teamsSection()
            }
        }
        collectionView.setCollectionViewLayout(layout, animated: true)
        viewModel?.getUpcomingDetailsOverNetwork(legType: LeagueType, legkey: leagueKey)
        viewModel?.getLatestDetailsOverNetwork(legType: LeagueType, legkey: leagueKey)
        viewModel?.getTeams(leagueId: leagueKey)
        
        viewModel?.bindUpcomingEventResult = { [weak self] in
            self?.upcomingEventsList = self!.viewModel?.upcomingResult ?? []
            DispatchQueue.main.async { [self] in
                self?.collectionView.reloadData()
            }
            
        }
        
        viewModel?.bindLatestEventResult = { [weak self] in
            self?.latestEventsList = self!.viewModel?.latestResult ?? []
            DispatchQueue.main.async { [self] in
                self?.collectionView.reloadData()
            }
            
        }
        
        viewModel?.bindTeamsResult = {[weak self] in
            self?.teamsList = self!.viewModel?.teamsResult ?? []
            DispatchQueue.main.async { [self] in
                self?.collectionView.reloadData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        collectionView.reloadData()
    }

    @objc func addToFav(){
        if(navigationItem.rightBarButtonItem?.image == UIImage(systemName: "heart.fill")){
            navigationItem.rightBarButtonItem?.image = UIImage(systemName: "heart")
            //viewModel?.removeFromFav(league: leagueObj)
        }else{
            navigationItem.rightBarButtonItem?.image = UIImage(systemName: "heart.fill")
            viewModel?.addToFav(league: leagueObj,leaguetype: LeagueType)
        }
        
        
       
    }
    
    
    func upcomingSection() -> NSCollectionLayoutSection{
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            let groupSize = NSCollectionLayoutSize(widthDimension:        .fractionalWidth(1), heightDimension: .absolute(220))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .continuous
        
        section.visibleItemsInvalidationHandler = { (items, offset, environment) in
             items.forEach { item in
             let distanceFromCenter = abs((item.frame.midX - offset.x) - environment.container.contentSize.width / 2.0)
             let minScale: CGFloat = 0.8
             let maxScale: CGFloat = 1.0
             let scale = max(maxScale - (distanceFromCenter / environment.container.contentSize.width), minScale)
             item.transform = CGAffineTransform(scaleX: scale, y: scale)
             }
        }
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50))
                let headerSupplementary = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
                
                section.boundarySupplementaryItems = [headerSupplementary]
        
        
        return section
    }
    
    
    func LatestSection()->NSCollectionLayoutSection {
        
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1)
            , heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1)
            , heightDimension: .absolute(180))
            let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize
            , subitems: [item])
            group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0
            , bottom: 8, trailing: 0)
            
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 15
            , bottom: 50, trailing: 15)
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50))
                let headerSupplementary = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
                
                section.boundarySupplementaryItems = [headerSupplementary]
            return section
        }
    
    func teamsSection() -> NSCollectionLayoutSection{
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            let groupSize = NSCollectionLayoutSize(widthDimension:        .fractionalWidth(0.7), heightDimension: .absolute(225))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .continuous
        
        section.visibleItemsInvalidationHandler = { (items, offset, environment) in
             items.forEach { item in
             let distanceFromCenter = abs((item.frame.midX - offset.x) - environment.container.contentSize.width / 2.0)
             let minScale: CGFloat = 0.8
             let maxScale: CGFloat = 1.0
             let scale = max(maxScale - (distanceFromCenter / environment.container.contentSize.width), minScale)
             item.transform = CGAffineTransform(scaleX: scale, y: scale)
             }
        }
        
        
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50))
                let headerSupplementary = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize, elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
                
                section.boundarySupplementaryItems = [headerSupplementary]
        
        return section
    }
   
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch(section){
        case 0:
            return upcomingEventsList.count
        case 1:
            return latestEventsList.count
        case 2:
            return teamsList.count
        default:
            return 0
        }
        
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch(indexPath.section){
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "upcoming", for: indexPath) as! UpcomingCell
            cell.layer.borderColor = CGColor(red: 52, green: 199, blue: 89, alpha: 1)
            cell.layer.cornerRadius = 20
            
            cell.homeTeamLabel.text = upcomingEventsList[indexPath.row].leagueName
            
            KF.url(URL(string: upcomingEventsList[indexPath.row].homeTeamLogo ?? ""))
              .placeholder(UIImage(named: "lg.png"))
              .set(to: cell.homeTeamImg)
            
            KF.url(URL(string: upcomingEventsList[indexPath.row].awayTeamLogo ?? ""))
              .placeholder(UIImage(named: "lg.png"))
              .set(to: cell.enemyTeamImg)
            
            cell.enemyName.text = upcomingEventsList[indexPath.row].leagueName
            cell.dateLabel.text = upcomingEventsList[indexPath.row].eventDate
            cell.timeLabel.text = upcomingEventsList[indexPath.row].eventTime
            
            
            return cell
            
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "latest", for: indexPath) as! LatestCell
            cell.layer.borderColor = CGColor(red: 52, green: 199, blue: 89, alpha: 1)
            cell.layer.cornerRadius = 20
            
            cell.homeTeamName.text = latestEventsList[indexPath.row].leagueName
            cell.enemyName.text = latestEventsList[indexPath.row].leagueName
            
            KF.url(URL(string: latestEventsList[indexPath.row].awayTeamLogo ?? ""))
              .placeholder(UIImage(named: "lg.png"))
              .set(to: cell.enemyImg)
            
            KF.url(URL(string: latestEventsList[indexPath.row].homeTeamLogo ?? ""))
              .placeholder(UIImage(named: "lg.png"))
              .set(to: cell.homeTeamImg)
            
            cell.scoreLabel.text = latestEventsList[indexPath.row].eventFinalResult
            cell.dateLabel.text = latestEventsList[indexPath.row].eventDate
            cell.timeLabel.text = latestEventsList[indexPath.row].eventTime
            
            print("team key \(latestEventsList[0].homeTeamKey)")
            return cell
            
           
            
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "teams", for: indexPath) as! TeamCell
            cell.layer.borderColor = CGColor(red: 52, green: 199, blue: 89, alpha: 1)
            cell.layer.cornerRadius = 20
            
            KF.url(URL(string: teamsList[indexPath.row].teamLogo ?? ""))
              .placeholder(UIImage(named: "lg.png"))
              .set(to: cell.TeamImg)
        
            cell.teamName.text = teamsList[indexPath.row].teamName
            return cell
        }
        
       
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        print("kind is \(kind)")
        let  sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "detailsHeader", for: indexPath) as? DetailsHeader
            print("from section header")
        if kind == UICollectionView.elementKindSectionHeader {
                
                switch(indexPath.section){
                case 0:
                    sectionHeader!.headerText.text = "Upcoming Events"
                case 1:
                    sectionHeader!.headerText.text = "Latest Events"
                default:
                    sectionHeader!.headerText.text = "Teams"
                    
                }
            }
        return sectionHeader!
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 50, height: 50)
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let teamDetails = storyboard?.instantiateViewController(withIdentifier: "teamdetails") as! TeamDetailsViewController
        
        switch(indexPath.section){
        case 2:
            teamDetails.teamKey = teamsList[indexPath.row].teamKey
            teamDetails.teamPhoto =  teamsList[indexPath.row].teamLogo ?? ""
            teamDetails.teamTitle = teamsList[indexPath.row].teamName ?? ""
            print("ghhhhhhhhhhhhhh")
            navigationController?.pushViewController(teamDetails, animated: true)
        default:
            break
        }
    }
}
