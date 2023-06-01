//
//  Genres.swift
//  WalmartMovieDB
//
//  Created by Ge Ding on 12/16/21.
//

import Foundation
struct Genres:Codable {
    var genres:[Genre]?
}

struct Genre: Codable {
    let id: Int
    let name: String
}
