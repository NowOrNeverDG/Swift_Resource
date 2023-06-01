//
//  APIHandler.swift
//  WalmartMovieDB
//
//  Created by Ge Ding on 12/16/21.
//

import Foundation

class APIHandler {
    static let shared = APIHandler()
    private init(){}
    
    func fetchData(url:URL, completionHandler: @escaping ((Movies) ->Void)) {
        
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if data != nil && error == nil {
                    let decoder = JSONDecoder()
                    let model = try! decoder.decode(Movies.self, from: data!)
                    let movieListModel = model
                    completionHandler(movieListModel)
            }
        }.resume()
    }
    
    func fetchGenreData(url:URL, completionHandler: @escaping ((Genres) ->Void)) {
        
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if data != nil && error == nil {
                    let decoder = JSONDecoder()
                do {
                    let model = try decoder.decode(Genres.self, from: data!)
                    completionHandler(model)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
}
