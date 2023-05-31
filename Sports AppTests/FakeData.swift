//
//  FakeData.swift
//  Sports AppTests
//
//  Created by Mac on 31/05/2023.
//

import Foundation
@testable import Sports_App

class FakeNetwork{
    
    var shouldReturnError: Bool
    let leagueJSONFakeResponse:MyResult = MyResult(success: 1, result: [LeagueResult(leagueKey: 4, leagueName: "UEFA Europa League", countryKey: 1, countryName: "eurocups", leagueLogo: "https:\\apiv2.allsportsapi.com/logo/logo_leagues/", countryLogo: nil),LeagueResult(leagueKey: 1, leagueName: "European Championship", countryKey: 1, countryName: "eurocups", leagueLogo: nil, countryLogo: nil)])
    
    let leagueDetailsFakeResponse:EventResult = EventResult(success: 1, result: [UpcomingEvent(eventKey: 1191799, eventDate: "2023-04-27"
, eventTime: "21:00", eventHomeTeam: "Fiorentina", homeTeamKey: 4974, eventAwayTeam: "Cremonese", awayTeamKey: 4998
, eventHalftimeResult: "0-0", eventFinalResult: "0-0", eventFtResult: "0-0", eventPenaltyResult: "0-0", eventStatus: "Finished"
, countryName: "Italy", leagueName: "Coppa Italia - Semi-finals", leagueKey: 205, leagueRound:"Semi-finals", leagueSeason: "2022/2023", eventLive:"0", eventStadium: "Stadio Artemio Franchi (Firenze)"
, eventReferee: "L. Marinelli", homeTeamLogo:"https://apiv2.allsportsapi.com/logo/4974_fiorentina.jpg"
, awayTeamLogo: "https://apiv2.allsportsapi.com/logo/4974_fiorentina.jpg", eventCountryKey: 1, leagueLogo: "logo.png", countryLogo: "clogo.png", eventHomeFormation: "4-3-3", eventAwayFormation: "0", fkStageKey: 0, stageName: "name"),
       UpcomingEvent(eventKey: 12345678, eventDate: "2024-7-7", eventTime: "20:00", eventHomeTeam: "AlAhly", homeTeamKey: 12, eventAwayTeam: "AlZamalek", awayTeamKey: 13, eventHalftimeResult: "0-0", eventFinalResult: "0-0", eventFtResult: "0-0", eventPenaltyResult: "0-0", eventStatus: "", countryName: "cairo", leagueName: "img.jpg", leagueKey: 1, leagueRound: "round1", leagueSeason: "2023/2024", eventLive: "0", eventStadium: "cairo studium", eventReferee: "cairo", homeTeamLogo: " logo.png", awayTeamLogo: "awaylogo.png", eventCountryKey: 2, leagueLogo: "leaguelogo.png", countryLogo: "country.png", eventHomeFormation: "0", eventAwayFormation: "0", fkStageKey: 0, stageName: "stagename")
    ])
    
    
    
    let teamFakeResponse : TeamResponse = TeamResponse(success: 1, result: [TeamResult(teamKey: 1, teamName: "team1", teamLogo: "team1logo", players: nil, coaches: nil),
        TeamResult(teamKey: 2, teamName: "team2", teamLogo: "team2logo", players: nil, coaches: nil)])
    
    init(shouldReturnError: Bool) {
        self.shouldReturnError = shouldReturnError
    }
}

enum ResponseError : Error{
    case error
}

extension FakeNetwork {
    func getLeaguesOverNetwork(compilitionHandler: @escaping (MyResult?,Error?) -> Void) {
        
        if shouldReturnError{
            compilitionHandler(nil,ResponseError.error)
            
        }else{
           
            compilitionHandler(leagueJSONFakeResponse,nil)
        }
    }
    
    
    func getLeagueDetails(compilitionHandler: @escaping (EventResult?,Error?) -> Void){
        
        
        if shouldReturnError{
            compilitionHandler(nil,ResponseError.error)
            
        }else{
           
            compilitionHandler(leagueDetailsFakeResponse,nil)
        }
        
    }
    
    func getTeams(compilitionHandler: @escaping (TeamResponse?,Error?) -> Void){
        
        if shouldReturnError{
            compilitionHandler(nil,ResponseError.error)
            
        }else{
            compilitionHandler(teamFakeResponse,nil)
        }
    }
    
    
}

