//
//  DetailsViewModel.swift
//  Sports App
//
//  Created by Mac on 23/05/2023.
//

import Foundation

class LeaguesDetailsViewModel {
    
    var myNetwork:NetworkServicing
    init(myNetwork: NetworkServicing) {
        self.myNetwork = myNetwork
    }
    
    var bindEventResult : (()->()) = {}
    var myresult : [UpcomingEvent]!{
        didSet{
            bindEventResult()
        }
    }
    
    func getDetailsOverNetwork(url: String) {
        
        myNetwork.getLeagueDetails(url: url, compilitionHandler: { result in
            if let result = result {
                self.myresult = result.result
            }else {
               print("result is nil")
            }
        })
    }
}
