//
//  Sports_AppTests.swift
//  Sports AppTests
//
//  Created by Mac on 19/05/2023.
//

import XCTest
@testable import Sports_App

final class Sports_AppTests: XCTestCase {
    
    var networkMgr : NetworkServicing!
    var teamDetailsViewModel : TeamDetailsViewModel!
    var leaguesViewModel :LeaguesViewModel!

    override func setUpWithError() throws {
        networkMgr = NetworkService()
        teamDetailsViewModel = TeamDetailsViewModel(myNetwork: NetworkService())
        leaguesViewModel = LeaguesViewModel(myNetwork: NetworkService())
    }

    override func tearDownWithError() throws {
        networkMgr = nil
        teamDetailsViewModel = nil
        leaguesViewModel = nil
    }

   
    func testGetLeaguesOverNetwork(){
        let myExpectation = expectation(description: "waiting for response")
        networkMgr.getLeaguesOverNetwork(url: ApiUrls.footballLeague.rawValue) { result in
            guard let result = result else {
                XCTFail("result is nil")
                return
            }
            XCTAssert(result.result.count > 0)
            myExpectation.fulfill()
        }
        waitForExpectations(timeout: 10)
    }
    
    func testGetLeaguedetailsOverNetwork(){
        
        let url = ApiUrls.footballLeague.rawValue + "&leagueId=7&from=" + getCurrentDate().current + "&to=" + getCurrentDate().future + "&APIkey=b7cec958d99cadc1a45d46998255a420e8ed1b99653755908b46ae0dd017b9d8"
        
        
        let myExpectation = expectation(description: "waiting for response")
        networkMgr.getLeagueDetails(url: url) { result in
            guard let result = result else {
                XCTFail("result is nil")
                return
            }
            XCTAssert(result.result!.count > 0)
            myExpectation.fulfill()
        }
        waitForExpectations(timeout: 10)
    }
    
    
    
    func testGetTeams(){
        
        let url = ApiUrls.teams.rawValue + "80&APIkey=b7cec958d99cadc1a45d46998255a420e8ed1b99653755908b46ae0dd017b9d8"
        let myExpectation = expectation(description: "waiting for response")
        networkMgr.getTeams(url: url) { team in
            guard let team = team else {
                XCTFail("result is nil")
                return
            }
            XCTAssert(team.result!.count > 0)
            XCTAssertNotNil(team.result?.count)
            XCTAssertFalse(team.success != 1)
            myExpectation.fulfill()
        }
        waitForExpectations(timeout: 10)
    }
    
    
    func testGetTeamDetails (){
        let url = ApiUrls.teamDetails.rawValue + "93&APIkey=b7cec958d99cadc1a45d46998255a420e8ed1b99653755908b46ae0dd017b9d8"
        let myExpectation = expectation(description: "waiting for response")
        networkMgr.getTeamDetails(url: url) { details in
            guard let details = details else {
                XCTFail("result is nil")
                return
            }
            XCTAssert(details.result!.count == 1)
            XCTAssertNotNil(details.result?.count)
            XCTAssertFalse(details.success != 1)
            myExpectation.fulfill()
        }
        waitForExpectations(timeout: 10)
    }
    
    
    func testBindTeamDetailsResult(){
        teamDetailsViewModel.getTeamDetails(teamKey: 73)
        teamDetailsViewModel.bindTeamDetailsResult = { [weak self] in
          // XCTAssertTrue((self?.teamDetailsViewModel.detailsResult.count)! > 0)
          //  XCTAssertNotNil((self?.teamDetailsViewModel.detailsResult.count)! )
        }
    }
    
    func testBindLeagesViewModel(){
        leaguesViewModel.getLeaguesOverNetwork(url: ApiUrls.basketballLeague.rawValue)
        
        leaguesViewModel.bindFootballResult = { [weak self] in
           // XCTAssertNotNil(self?.leaguesViewModel.myresult)
           // XCTAssertGreaterThan((self?.leaguesViewModel.myresult.count)!, 0)
            
        }
    }


}
