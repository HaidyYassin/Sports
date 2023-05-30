//
//  UtilityFuncs.swift
//  Sports App
//
//  Created by Mac on 23/05/2023.
//

import Foundation
//https://apiv2.allsportsapi.com/football?met=Fixtures&leagueId=205&from=from=2022-01-18&to=2023-01-18&APIkey=[YourKey]

//https://apiv2.allsportsapi.com/football?met=Fixtures&leagueId=[leagueId]&from=[CurrentDate]&to=[CurrentDate + OneYear]&APIkey=[YourKey]


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
