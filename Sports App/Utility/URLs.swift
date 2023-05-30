//
//  URLs.swift
//  Sports App
//
//  Created by Mac on 23/05/2023.
//

import Foundation

//b7cec958d99cadc1a45d46998255a420e8ed1b99653755908b46ae0dd017b9d8
//https://apiv2.allsportsapi.com/football?met=Fixtures&leagueId=205&from=2023-01-18&to=2024-01-18&APIkey=[YourKey]

enum ApiUrls : String{
    case footballLeague = "https://apiv2.allsportsapi.com/football/?met=Leagues&APIkey=b7cec958d99cadc1a45d46998255a420e8ed1b99653755908b46ae0dd017b9d8"
    
    case basketballLeague = "https://apiv2.allsportsapi.com/basketball/?met=Leagues&APIkey=b7cec958d99cadc1a45d46998255a420e8ed1b99653755908b46ae0dd017b9d8"
    
    case cricketLeague = "https://apiv2.allsportsapi.com/cricket/?met=Leagues&APIkey=b7cec958d99cadc1a45d46998255a420e8ed1b99653755908b46ae0dd017b9d8"
    
    case tennisUrl = "https://apiv2.allsportsapi.com/tennis/?met=Leagues&APIkey=b7cec958d99cadc1a45d46998255a420e8ed1b99653755908b46ae0dd017b9d8"
    
    case footballEvent = "https://apiv2.allsportsapi.com/football?met=Fixtures"
    case basketballEvent = "https://apiv2.allsportsapi.com/basketball/?met=Fixtures"
    case creckitEvent = "https://apiv2.allsportsapi.com/cricket/?met=Fixtures"
    case tennisEvent = "https://apiv2.allsportsapi.com/tennis/?met=Fixtures"
    
    case teams = "https://apiv2.allsportsapi.com/football/?&met=Teams&leagueId="
    case teamDetails = "https://apiv2.allsportsapi.com/football/?&met=Teams&teamId="
}


