//
//  URLPath.swift
//  WalmartMovieDB
//
//  Created by Ge Ding on 12/16/21.
//

import Foundation
class URLPath {
    static let shared = URLPath()
    private init () {}
    var api_url_path = "https://api.themoviedb.org/3/movie/popular?api_key="
    var image_url_path = "https://image.tmdb.org/t/p/w500"
    var API_KEY = "c91ed3a7a344459eccad9687acf0d07e"
    var genre_url = "https://api.themoviedb.org/3/genre/movie/list?api_key="
    
    func getUrlPath()->String {
        return api_url_path + API_KEY
    }
    func getImgPath()->String {
        return image_url_path + API_KEY
    }
}
