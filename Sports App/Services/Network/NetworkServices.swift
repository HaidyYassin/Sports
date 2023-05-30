//
//  NetworkServices.swift
//  Sports App
//
//  Created by Mac on 21/05/2023.
//

import Foundation
import Alamofire


protocol NetworkServicing{
    func getLeaguesOverNetwork(url:String,compilitionHandler: @escaping (MyResult?) -> Void)
    
    func getLeagueDetails(url:String,compilitionHandler: @escaping (EventResult?) -> Void)
    
    func getTeams(url:String,compilitionHandler: @escaping (TeamResponse?) -> Void)
    
    func getTeamDetails(url: String, compilitionHandler: @escaping (TeamResponse?) -> Void)
}

class NetworkService : NetworkServicing{
   
    func getLeaguesOverNetwork(url:String, compilitionHandler: @escaping (MyResult?) -> Void)
    {
    
        Alamofire.request(url, method: .get, parameters: nil).responseJSON{ response in
            do{
                if(response.result.isSuccess){
                   let result: MyResult = try JSONDecoder().decode(MyResult.self, from: response.data!)
                    print("leagues size : \(result.result.count)")
                   debugPrint(result)
                compilitionHandler(result)
            }
            }catch let error {
                print(error.localizedDescription)
            }
        }
    }
    
    
    func getLeagueDetails(url: String, compilitionHandler: @escaping (EventResult?) -> Void) {
        
        print("inside events func")
        
        Alamofire.request(url, method: .get, parameters: nil).responseJSON{ response in
            do{
                if(response.result.isSuccess){
                   let result: EventResult = try JSONDecoder().decode(EventResult.self, from: response.data!)
                    print("Event response size : \(String(describing: result.result?.count))")
                   debugPrint(result)
                compilitionHandler(result)
            }
            }catch let error {
                print(error.localizedDescription)
                print(String(describing: error))
            }
        }
    }
    
    
    func getTeams(url: String, compilitionHandler: @escaping (TeamResponse?) -> Void) {
        Alamofire.request(url, method: .get, parameters: nil).responseJSON{ response in
            do{
                if(response.result.isSuccess){
                   let result: TeamResponse = try JSONDecoder().decode(TeamResponse.self, from: response.data!)
                    print("teams size : \(result.result?.count)")
                   debugPrint(result)
                compilitionHandler(result)
            }
            }catch let error {
                print(error.localizedDescription)
            }
        }
    }
    
    
    func getTeamDetails(url: String, compilitionHandler: @escaping (TeamResponse?) -> Void) {
        Alamofire.request(url, method: .get, parameters: nil).responseJSON{ response in
            do{
                if(response.result.isSuccess){
                   let result: TeamResponse = try JSONDecoder().decode(TeamResponse.self, from: response.data!)
                    print("teams details size: \(result.result?.count)")
                   debugPrint(result)
                compilitionHandler(result)
            }
            }catch let error {
                print(error.localizedDescription)
            }
        }
    }
}
