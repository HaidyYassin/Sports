//
//  MockNetwork.swift
//  Sports AppTests
//
//  Created by Mac on 31/05/2023.
//

import Foundation
import XCTest


final class MockNetwork: XCTestCase {

    var fakeNetwork : FakeNetwork!
    
    override func setUpWithError() throws {
        fakeNetwork = FakeNetwork(shouldReturnError: false)
    }

    override func tearDownWithError() throws {
        fakeNetwork = nil
    }
    
    func testLeaguesFromAPI(){
        
        fakeNetwork.getLeaguesOverNetwork(compilitionHandler:  { res, err in
            if err != nil {
                XCTFail()
            }else{
                XCTAssertNotNil(res)
            }
        })
    }
    
    
    func testLeaguesDetailsFromAPI(){
        
        fakeNetwork.getLeagueDetails { result, error in
            if error != nil {
                XCTFail()
            }else{
                XCTAssertNotNil(result)
            }
        }
    }
    
    func testGetTeams(){
        fakeNetwork.getTeams { team, error in
            if error != nil {
                XCTFail()
            }else{
                XCTAssertNotNil(team)
            }
        }
    }

   

}
