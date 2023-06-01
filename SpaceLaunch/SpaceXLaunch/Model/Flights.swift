//
//  Flights.swift
//  SpaceXLaunch
//
//  Created by Ge Ding on 8/11/22.
//

import Foundation

struct Flights: Codable {
    var flight_number: Int?
    var mission_name: String?
    var mission_id:[String]?
    var upcoming: Bool?
    var launch_year: String?
    var launch_date_unix: Double?
    var launch_date_utc: String?
    var launch_date_local: String?
    var is_tentative: Bool
    var tentative_max_precision: String?
    var tbd: Bool?
    var rocket: Rocket?
    var launch_site: LaunchSite?
    var links: Links?
    var launch_success: Bool?
    var details: String?
}

struct Rocket: Codable {
    var rocket_id: String
    var rocket_name: String
    var rocket_type: String
}

struct LaunchSite: Codable {
    var site_id: String?
    var site_name: String?
    var site_name_long: String?
}

struct Links: Codable {
    var mission_patch_small: String?
    var mission_patch: String?
}


