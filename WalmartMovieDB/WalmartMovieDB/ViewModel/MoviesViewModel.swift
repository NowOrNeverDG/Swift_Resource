//
//  MoviesViewModel.swift
//  WalmartMovieDB
//
//  Created by Ge Ding on 12/16/21.
//

import Foundation

class MovieViewModel {
    var apiHandler = APIHandler.shared
    var urlPath = URLPath.shared
    var movies:[Movie] = []
    var genres:[Genre] = []
    
    func fetchData(url:URL,completionHandler: @escaping (()->Void)) {//API Calling
        apiHandler.fetchData(url: url) { model in
            self.movies = model.results
            completionHandler()
        }
    }
    
    func fetchGenreData(url:URL,completionHandler: @escaping (()->Void)) {//API Calling
        apiHandler.fetchGenreData(url: URL(string: urlPath.genre_url + urlPath.API_KEY)!) { model in
            self.genres = model.genres ?? []
            completionHandler()
        }
    }
    
    func getRawCount() -> Int? {//get movies count
        return movies.count
    }
    
    func getMovie(index:Int) -> Movie? {
        //get all data of any movie base on index
        let movie = movies[index]
        return Movie(id: movie.id, popularity: movie.popularity, release_date: movie.release_date, title: movie.title, overview: movie.overview,original_language: movie.original_language, poster_path: movie.poster_path, backdrop_path: movie.backdrop_path, genre_ids: movie.genre_ids)
    }
    
    func getGeneresData(arrayIDs:[Int]) -> String{
        let result = genres.filter({ mGen in
            return arrayIDs.contains(mGen.id)
        })
        return result.map({$0.name}).joined(separator: " | ")
    }
    
    func getGenreIDsFor(index:Int) -> [Int] {
        return movies[index].genre_ids ?? []
    }
}
