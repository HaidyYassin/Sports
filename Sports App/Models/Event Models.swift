//
//  Event Models.swift
//  Sports App
//
//  Created by Mac on 20/05/2023.
//

import Foundation

class EventResult: Codable {
    var success: Int?
    var result: [UpcomingEvent]?

    init(success: Int, result: [UpcomingEvent]) {
        self.success = success
        self.result = result
    }
}

class UpcomingEvent: Codable {
    var eventKey: Int?
    var eventDate: String?
    var eventTime: String?
    var eventHomeTeam: String?
    var homeTeamKey: Int?
    var eventAwayTeam: String?
    var awayTeamKey: Int?
    var eventHalftimeResult, eventFinalResult, eventFtResult, eventPenaltyResult: String?
    var eventStatus: String?
    var countryName: String?
    var leagueName: String?
    var leagueKey: Int?
    var leagueRound: String?
    var leagueSeason: String?
    var eventLive, eventStadium, eventReferee: String?
    var homeTeamLogo, awayTeamLogo: String?
    var eventCountryKey: Int?
    var leagueLogo, countryLogo: String?
    var eventHomeFormation, eventAwayFormation: String?
    var fkStageKey: Int?
    var stageName: String?
    

    enum CodingKeys: String, CodingKey {
        case eventKey = "event_key"
        case eventDate = "event_date"
        case eventTime = "event_time"
        case eventHomeTeam = "event_home_team"
        case homeTeamKey = "home_team_key"
        case eventAwayTeam = "event_away_team"
        case awayTeamKey = "away_team_key"
        case eventHalftimeResult = "event_halftime_result"
        case eventFinalResult = "event_final_result"
        case eventFtResult = "event_ft_result"
        case eventPenaltyResult = "event_penalty_result"
        case eventStatus = "event_status"
        case countryName = "country_name"
        case leagueName = "league_name"
        case leagueKey = "league_key"
        case leagueRound = "league_round"
        case leagueSeason = "league_season"
        case eventLive = "event_live"
        case eventStadium = "event_stadium"
        case eventReferee = "event_referee"
        case homeTeamLogo = "home_team_logo"
        case awayTeamLogo = "away_team_logo"
        case eventCountryKey = "event_country_key"
        case leagueLogo = "league_logo"
        case countryLogo = "country_logo"
        case eventHomeFormation = "event_home_formation"
        case eventAwayFormation = "event_away_formation"
        case fkStageKey = "fk_stage_key"
        case stageName = "stage_name"
       
    }
    
    init(eventKey: Int, eventDate: String, eventTime: String, eventHomeTeam: String, homeTeamKey: Int, eventAwayTeam: String, awayTeamKey: Int, eventHalftimeResult: String, eventFinalResult: String, eventFtResult: String, eventPenaltyResult: String, eventStatus: String, countryName: String, leagueName: String, leagueKey: Int, leagueRound: String, leagueSeason: String, eventLive: String, eventStadium: String, eventReferee: String, homeTeamLogo: String, awayTeamLogo: String, eventCountryKey: Int, leagueLogo: String, countryLogo: String, eventHomeFormation: String, eventAwayFormation: String, fkStageKey: Int, stageName: String) {
        self.eventKey = eventKey
        self.eventDate = eventDate
        self.eventTime = eventTime
        self.eventHomeTeam = eventHomeTeam
        self.homeTeamKey = homeTeamKey
        self.eventAwayTeam = eventAwayTeam
        self.awayTeamKey = awayTeamKey
        self.eventHalftimeResult = eventHalftimeResult
        self.eventFinalResult = eventFinalResult
        self.eventFtResult = eventFtResult
        self.eventPenaltyResult = eventPenaltyResult
        self.eventStatus = eventStatus
        self.countryName = countryName
        self.leagueName = leagueName
        self.leagueKey = leagueKey
        self.leagueRound = leagueRound
        self.leagueSeason = leagueSeason
        self.eventLive = eventLive
        self.eventStadium = eventStadium
        self.eventReferee = eventReferee
        self.homeTeamLogo = homeTeamLogo
        self.awayTeamLogo = awayTeamLogo
        self.eventCountryKey = eventCountryKey
        self.leagueLogo = leagueLogo
        self.countryLogo = countryLogo
        self.eventHomeFormation = eventHomeFormation
        self.eventAwayFormation = eventAwayFormation
        self.fkStageKey = fkStageKey
        self.stageName = stageName
    }

}

class CardElement: Codable {
    let time, homeFault: String
    let card: CardEnum
    let awayFault, info, homePlayerID, awayPlayerID: String
    let infoTime: InfoTime

    enum CodingKeys: String, CodingKey {
        case time
        case homeFault = "home_fault"
        case card
        case awayFault = "away_fault"
        case info
        case homePlayerID = "home_player_id"
        case awayPlayerID = "away_player_id"
        case infoTime = "info_time"
    }

}

enum CardEnum: String, Codable {
    case redCard = "red card"
    case yellowCard = "yellow card"
}

enum InfoTime: String, Codable {
    case the1StHalf = "1st Half"
    case the2NdHalf = "2nd Half"
}

enum CountryName: String, Codable {
    case italy = "Italy"
}

enum EventStatus: String, Codable {
    case empty = ""
    case finished = "Finished"
}

enum EventTime: String, Codable {
    case the1500 = "15:00"
    case the1800 = "18:00"
    case the2100 = "21:00"
}

// MARK: - Goalscorer
class Goalscorer: Codable {
    let time, homeScorer, homeScorerID, homeAssist: String
    let homeAssistID, score, awayScorer, awayScorerID: String
    let awayAssist, awayAssistID: String
    let info: Info
    let infoTime: InfoTime

    enum CodingKeys: String, CodingKey {
        case time
        case homeScorer = "home_scorer"
        case homeScorerID = "home_scorer_id"
        case homeAssist = "home_assist"
        case homeAssistID = "home_assist_id"
        case score
        case awayScorer = "away_scorer"
        case awayScorerID = "away_scorer_id"
        case awayAssist = "away_assist"
        case awayAssistID = "away_assist_id"
        case info
        case infoTime = "info_time"
    }

}

enum Info: String, Codable {
    case empty = ""
    case penalty = "Penalty"
}

enum LeagueSeason: String, Codable {
    case the20222023 = "2022/2023"
}

// MARK: - Lineups
class Lineups: Codable {
    var homeTeam, awayTeam: Team?

    enum CodingKeys: String, CodingKey {
        case homeTeam = "home_team"
        case awayTeam = "away_team"
    }

    
}

// MARK: - Team
class Team: Codable {
    var startingLineups, substitutes: [StartingLineup]?
    var coaches: [Coach]?
    var missingPlayers: [JSONAny]?

    enum CodingKeys: String, CodingKey {
        case startingLineups = "starting_lineups"
        case substitutes, coaches
        case missingPlayers = "missing_players"
    }
}

// MARK: - Coach
class Coach: Codable {
    var coache: String?
    var coacheCountry: JSONNull?

    enum CodingKeys: String, CodingKey {
        case coache
        case coacheCountry = "coache_country"
    }

}

// MARK: - StartingLineup
class StartingLineup: Codable {
    var player: String?
    var playerNumber, playerPosition: Int?
    var playerCountry: JSONNull?
    var playerKey: Int?
    var infoTime: String?

    enum CodingKeys: String, CodingKey {
        case player
        case playerNumber = "player_number"
        case playerPosition = "player_position"
        case playerCountry = "player_country"
        case playerKey = "player_key"
        case infoTime = "info_time"
    }

}

// MARK: - Statistic
class Statistic: Codable {
    var type, home, away: String?

}

// MARK: - Substitute
class Substitute: Codable {
    var time: String?
    var homeScorer: AwayScorerUnion?
    var homeAssist: JSONNull?
    var score: Score?
    var awayScorer: AwayScorerUnion?
    var awayAssist, info: JSONNull?
    var infoTime: InfoTime?

    enum CodingKeys: String, CodingKey {
        case time
        case homeScorer = "home_scorer"
        case homeAssist = "home_assist"
        case score
        case awayScorer = "away_scorer"
        case awayAssist = "away_assist"
        case info
        case infoTime = "info_time"
    }

}

enum AwayScorerUnion: Codable {
    case anythingArray([JSONAny])
    case awayScorerClass(AwayScorerClass)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode([JSONAny].self) {
            self = .anythingArray(x)
            return
        }
        if let x = try? container.decode(AwayScorerClass.self) {
            self = .awayScorerClass(x)
            return
        }
        throw DecodingError.typeMismatch(AwayScorerUnion.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for AwayScorerUnion"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .anythingArray(let x):
            try container.encode(x)
        case .awayScorerClass(let x):
            try container.encode(x)
        }
    }
}

// MARK: - AwayScorerClass
class AwayScorerClass: Codable {
    var scorerIn, out: String?
    var inID, outID: Int?

    enum CodingKeys: String, CodingKey {
        case scorerIn = "in"
        case out
        case inID = "in_id"
        case outID = "out_id"
    }

    
}

enum Score: String, Codable {
    case substitution = "substitution"
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
