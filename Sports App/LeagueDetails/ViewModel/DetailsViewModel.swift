//
//  DetailsViewModel.swift
//  Sports App
//
//  Created by Mac on 23/05/2023.
//

import Foundation
import CoreData

class LeaguesDetailsViewModel {
    
    var myNetwork:NetworkServicing
    var myDBMgr : FavDBManager
    
    init(myNetwork: NetworkServicing, myDBMgr: FavDBManager) {
        self.myNetwork = myNetwork
        self.myDBMgr = myDBMgr
    }
    
    var bindUpcomingEventResult : (()->()) = {}
    var upcomingResult : [UpcomingEvent]!{
        didSet{
            bindUpcomingEventResult()
        }
    }
    
    var bindLatestEventResult : (()->()) = {}
    var latestResult : [UpcomingEvent]!{
        didSet{
            bindLatestEventResult()
        }
    }
    
    var bindTeamsResult : (()->()) = {}
    var teamsResult : [TeamResult]!{
        didSet{
            bindTeamsResult()
        }
    }
    
    func getUpcomingDetailsOverNetwork(legType: String, legkey:Int) {
        var upcomingUrl:String!
        
        switch(legType){
        case "Football":
             upcomingUrl = ApiUrls.footballEvent.rawValue + "&leagueId=" + String(format :"%d" ,legkey) + "&from=" + getCurrentDate().current + "&to=" + getCurrentDate().future + "&APIkey=b7cec958d99cadc1a45d46998255a420e8ed1b99653755908b46ae0dd017b9d8"
            
        case "Basketball":
             upcomingUrl = ApiUrls.basketballEvent.rawValue + "&leagueId=" + String(format :"%d" ,legkey) + "&from=" + getCurrentDate().current + "&to=" + getCurrentDate().future + "&APIkey=b7cec958d99cadc1a45d46998255a420e8ed1b99653755908b46ae0dd017b9d8"
            
        case "Cricket":
             upcomingUrl = ApiUrls.creckitEvent.rawValue + "&leagueId=" + String(format :"%d" ,legkey) + "&from=" + getCurrentDate().current + "&to=" + getCurrentDate().future + "&APIkey=b7cec958d99cadc1a45d46998255a420e8ed1b99653755908b46ae0dd017b9d8"
            
        case "Tennis":
             upcomingUrl = ApiUrls.tennisEvent.rawValue  + "&leagueId=" + String(format :"%d" ,legkey) + "&from=" + getCurrentDate().current + "&to=" + getCurrentDate().future + "&APIkey=b7cec958d99cadc1a45d46998255a420e8ed1b99653755908b46ae0dd017b9d8"
            
        default:
            break
        }
        
        
        myNetwork.getLeagueDetails(url: upcomingUrl, compilitionHandler: { result in
            if let result = result {
                self.upcomingResult = result.result
                print("getUpcomingDetailsOverNetwork \(result.result?.count)")
            }else {
               print("result is nil")
            }
        })
    }
    
    func getLatestDetailsOverNetwork(legType: String, legkey:Int) {
        
        var latestUrl:String!
        
        switch(legType){
        case "Football":
            latestUrl = ApiUrls.footballEvent.rawValue + "&leagueId=" + String(format :"%d" ,legkey) + "&from=" + getCurrentDate().past + "&to=" + getCurrentDate().current + "&APIkey=b7cec958d99cadc1a45d46998255a420e8ed1b99653755908b46ae0dd017b9d8"
            
        case "Basketball":
            latestUrl = ApiUrls.basketballEvent.rawValue + "&leagueId=" + String(format :"%d" ,legkey) + "&from=" + getCurrentDate().past + "&to=" + getCurrentDate().current + "&APIkey=b7cec958d99cadc1a45d46998255a420e8ed1b99653755908b46ae0dd017b9d8"
            
        case "Cricket":
            latestUrl = ApiUrls.creckitEvent.rawValue + "&leagueId=" + String(format :"%d" ,legkey) + "&from=" + getCurrentDate().past + "&to=" + getCurrentDate().current + "&APIkey=b7cec958d99cadc1a45d46998255a420e8ed1b99653755908b46ae0dd017b9d8"
            
        case "Tennis":
            latestUrl = ApiUrls.tennisEvent.rawValue  + "&leagueId=" + String(format :"%d" ,legkey) + "&from=" + getCurrentDate().past + "&to=" + getCurrentDate().current + "&APIkey=b7cec958d99cadc1a45d46998255a420e8ed1b99653755908b46ae0dd017b9d8"
            
        default:
            break
        }
        
        
        
        myNetwork.getLeagueDetails(url: latestUrl, compilitionHandler: { result in
            if let result = result {
                self.latestResult = result.result
                print("getLatestDetailsOverNetwork \(result.result?.count)")
            }else {
               print("result is nil")
            }
        })
    }
    
    func getTeams(leagueId:Int){
        myNetwork.getTeams(url: ApiUrls.teams.rawValue + String(format: "%d", leagueId)+"&APIkey=b7cec958d99cadc1a45d46998255a420e8ed1b99653755908b46ae0dd017b9d8", compilitionHandler: { result in
            if let result = result {
                self.teamsResult = result.result
                print("getTeams \(result.result?.count)")
            }else {
               print("result is nil")
            }
        })
    }
    
    
    func addToFav(league:LeagueResult, leaguetype:String){
        myDBMgr.insertLeague(League: league, type: leaguetype)
    }
    
    func removeFromFav(league:NSManagedObject){
        myDBMgr.deleteLeague(league: league)
    }
}
