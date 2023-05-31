//
//  ViewModel.swift
//  Sports App
//
//  Created by Mac on 30/05/2023.
//

import Foundation

class TeamDetailsViewModel{
    
    var myNetwork:NetworkServicing
    init(myNetwork: NetworkServicing) {
        self.myNetwork = myNetwork
    }
    
    
    var bindTeamDetailsResult : (()->()) = {}
    var detailsResult : [TeamResult]!{
        didSet{
            bindTeamDetailsResult()
        }
    }
    
    
    func getTeamDetails(teamKey:Int){
        myNetwork.getTeamDetails(url: ApiUrls.teamDetails.rawValue + String(format: "%d", teamKey)+"&APIkey=b7cec958d99cadc1a45d46998255a420e8ed1b99653755908b46ae0dd017b9d8", compilitionHandler: { result in
            if let result = result {
                self.detailsResult = result.result
                print("getTeam details \(result.result?.count)")
            }else {
               print("result is nil")
            }
        })
    }
}
