//
//  Repository.swift
//  Sports App
//
//  Created by Mac on 21/05/2023.
//

import Foundation

protocol RepositoryProtocol {
    func getLeaguesOverNetwork(url:String) -> [LeagueResult]
}

class Repository : RepositoryProtocol{
    
    var myFavMgr:FavDBManager?
    var myNetwork:NetworkServicing?
    
    
    
    private init( myFavMgr: FavDBManager, myNetwork: NetworkService) {
        self.myFavMgr = myFavMgr
        self.myNetwork = myNetwork
    }
    
    public static func getRepoInstance( favdb:FavDBManager, network:NetworkService)-> Repository{
        let repoInstance = Repository( myFavMgr: favdb, myNetwork: network)
        return repoInstance
    }

    
    func getLeaguesOverNetwork(url: String) -> [LeagueResult] {
        var leaguesList: [LeagueResult] = []
        myNetwork?.getLeaguesOverNetwork(url: url, compilitionHandler: { result in
            if let result = result {
                leaguesList = result.result
            }else {
               print("result is nil")
            }
        })
        
        return leaguesList
    }
    
}
