//
//  UtilityFuncs.swift
//  Sports App
//
//  Created by Mac on 23/05/2023.
//

import Foundation
import Reachability

func getCurrentDate() -> (current: String,future :String, past:String){
    
    let date = Date()
    let dateFormatter = DateFormatter()
    var dateComponent = DateComponents()
    
    dateFormatter.dateFormat = "yyyy-MM-dd"
    let currentDate = dateFormatter.string(from: date)
    print(currentDate)
    
    dateComponent.year = 1
    let plusyear =  Calendar.current.date(byAdding: dateComponent, to: date)
    let futureDate = dateFormatter.string(from: plusyear!)
    print(futureDate)
    
    dateComponent.year = -1
    let minusyear =  Calendar.current.date(byAdding: dateComponent, to: date)
    let lastDate = dateFormatter.string(from: minusyear!)
    print(lastDate)
    
    return(currentDate,futureDate,lastDate)
    
}

func checkReachability() -> Bool{
  
    var isReachabe = false
    
    do{
        let reachability = try Reachability()
        
        reachability.whenReachable = { reachability in
            if reachability.connection == .wifi {
                print("Reachable via WiFi")
                isReachabe = true
            } else {
                print("Reachable via Cellular")
                isReachabe=true
            }
        }
        reachability.whenUnreachable = { _ in
            print("Not reachable")
            isReachabe = false
        }
        
        do {
            try reachability.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
    }catch {
        print("Unable to start notifier")
    }
    
    return isReachabe
}
