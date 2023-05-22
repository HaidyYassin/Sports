//
//  Models.swift
//  Sports App
//
//  Created by Mac on 20/05/2023.
//

import Foundation


class MyResult: Codable {
    let success: Int
    let result: [Result]

    init(success: Int, result: [Result]) {
        self.success = success
        self.result = result
    }
}

class Result: Codable {
    var leagueKey: Int?
    var leagueName: String?
    var countryKey: Int?
    var countryName: String?
    var leagueLogo : String?
    var countryLogo: String?

    enum CodingKeys: String, CodingKey {
        case leagueKey = "league_key"
        case leagueName = "league_name"
        case countryKey = "country_key"
        case countryName = "country_name"
        case leagueLogo = "league_logo"
        case countryLogo = "country_logo"
    }

    
}
