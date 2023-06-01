//
//  Movies.swift
//  WalmartMovieDB
//
//  Created by Ge Ding on 12/16/21.
//

import Foundation
struct Movies: Codable {
    var results: [Movie] = []
}

struct Movie: Codable {
    var id: Int?
    var popularity: Double?
    var release_date: String?
    var title: String?
    var overview: String?
    var original_language: String?
    var poster_path: String?
    var backdrop_path: String?
    var genre_ids: [Int]?
    
}
