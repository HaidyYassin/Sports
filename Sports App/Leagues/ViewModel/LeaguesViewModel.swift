//
//  LeaguesViewModel.swift
//  Sports App
//
//  Created by Mac on 21/05/2023.
//

import Foundation

class LeaguesViewModel {
    
    var myNetwork:NetworkServicing
    init(myNetwork: NetworkServicing) {
        self.myNetwork = myNetwork
    }
    
    var bindFootballResult : (()->()) = {}
    var myresult : [Result]!{
        didSet{
            bindFootballResult()
        }
    }
    
    func getLeaguesOverNetwork(url: String) {
        
        myNetwork.getLeaguesOverNetwork(url: url, compilitionHandler: { result in
            if let result = result {
                self.myresult = result.result
            }else {
               print("details result is nil")
            }
        })
    }
}
