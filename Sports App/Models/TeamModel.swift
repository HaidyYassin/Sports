//
//  TeamModel.swift
//  Sports App
//
//  Created by Mac on 30/05/2023.
//

import Foundation

// MARK: - TeamResponse
class TeamResponse: Codable {
    var success: Int?
    var result: [TeamResult]?

    init(success: Int?, result: [TeamResult]?) {
        self.success = success
        self.result = result
    }
}

// MARK: - Result
class TeamResult: Codable {
    var teamKey: Int?
    var teamName: String?
    var teamLogo: String?
    var players: [Player]?
    var coaches: [CoachClass]?

    enum CodingKeys: String, CodingKey {
        case teamKey = "team_key"
        case teamName = "team_name"
        case teamLogo = "team_logo"
        case players = "players"
        case coaches = "coaches"
    }

    init(teamKey: Int?, teamName: String?, teamLogo: String?, players: [Player]?, coaches: [CoachClass]?) {
        self.teamKey = teamKey
        self.teamName = teamName
        self.teamLogo = teamLogo
        self.players = players
        self.coaches = coaches
    }
}

// MARK: - Coach
class CoachClass: Codable {
    var coachName: String?

    enum CodingKeys: String, CodingKey {
        case coachName = "coach_name"
    }

    init(coachName: String?, coachCountry: JSONNull?, coachAge: JSONNull?) {
        self.coachName = coachName
    }
}

// MARK: - Player
class Player: Codable {
    var playerKey: Int?
    var playerName, playerNumber: String?
    var playerType: PlayerType?
    var playerAge, playerMatchPlayed, playerGoals, playerYellowCards: String?
    var playerRedCards: String?
    var playerImage: String?

    enum CodingKeys: String, CodingKey {
        case playerKey = "player_key"
        case playerName = "player_name"
        case playerNumber = "player_number"
        case playerType = "player_type"
        case playerAge = "player_age"
        case playerMatchPlayed = "player_match_played"
        case playerGoals = "player_goals"
        case playerYellowCards = "player_yellow_cards"
        case playerRedCards = "player_red_cards"
        case playerImage = "player_image"
    }

    init(playerKey: Int?, playerName: String?, playerNumber: String?, playerCountry: JSONNull?, playerType: PlayerType?, playerAge: String?, playerMatchPlayed: String?, playerGoals: String?, playerYellowCards: String?, playerRedCards: String?, playerImage: String?) {
        self.playerKey = playerKey
        self.playerName = playerName
        self.playerNumber = playerNumber
        self.playerType = playerType
        self.playerAge = playerAge
        self.playerMatchPlayed = playerMatchPlayed
        self.playerGoals = playerGoals
        self.playerYellowCards = playerYellowCards
        self.playerRedCards = playerRedCards
        self.playerImage = playerImage
    }
}

enum PlayerType: String, Codable {
    case defenders = "Defenders"
    case forwards = "Forwards"
    case goalkeepers = "Goalkeepers"
    case midfielders = "Midfielders"
}


