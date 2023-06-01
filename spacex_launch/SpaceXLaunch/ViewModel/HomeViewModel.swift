//
//  ViewModel.swift
//  SpaceXLaunch
//
//  Created by Ge Ding on 8/11/22.
//

import Foundation

class HomeViewModel {
    let apiHandler = APIHandler.shared
    var flights:[Flights] = []
    func getData(url:URL, completionHandler: @escaping()->Void) {
        apiHandler.fetchData(url: url) { response in
            self.flights = response
            self.flights.sort { x, y in
                return x.launch_date_unix ?? 0 > y.launch_date_unix ?? 0
            }
            completionHandler()
        }
    }
    
    func getCount() -> Int {
        return flights.count
    }
    
    func getMissionName(index:Int) -> String{
        return self.flights[index].mission_name ?? "N/A"
    }
    
    func getRocketName(index:Int) -> String {
        return self.flights[index].rocket?.rocket_name ?? "N/A"
    }
    
    func getLaunchSiteName(index: Int) -> String {
        return self.flights[index].launch_site?.site_name ?? "N/A"
    }
    
    func getDateOfLaunch(index: Int) -> String {
        let isoDate = self.flights[index].launch_date_utc ?? "N/A"
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US-POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        if let date = dateFormatter.date(from: isoDate) {
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let dateStr = dateFormatter.string(from: date)
            return dateStr
        }
        
        return ""
    }
    
    func getMissionStatus(index:Int) -> String {
        let success = self.flights[index].launch_success
        return success == true ? "SUCCESS" : "FAILED"
    }
    
    func getPatchImageUrlString(index: Int) -> String {
        return self.flights[index].links?.mission_patch_small ?? ""
    }
    
    func getLandscapeUrlString(index: Int) -> String{
        return self.flights[index].links?.mission_patch ?? ""
    }
    
    func getDetail(index: Int) -> String {
        return self.flights[index].details ?? "N/A"
    }
    
    func getRocketType(index: Int) -> String {
        return self.flights[index].rocket?.rocket_type ?? "N/A"
    }
    
    func getSiteName(index: Int) -> String {
        return self.flights[index].launch_site?.site_name ?? "N/A"
    }
}

