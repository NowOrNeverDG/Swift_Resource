//
//  WalmartMovieDBTests.swift
//  WalmartMovieDBTests
//
//  Created by Ge Ding on 12/16/21.
//

import XCTest
@testable import WalmartMovieDB

class WalmartMovieDBTests: XCTestCase {
    var moviesVM: MovieViewModel?
    var urlPath = URLPath.shared
    override func setUpWithError() throws {
        moviesVM = MovieViewModel()
        let movie = Movie(id: 12345, popularity: 99.99, release_date: "2021/12/25", title: "Merry Christmas", overview: "Merry Christmas everyone!", original_language: "en", poster_path: "poster.jpg", backdrop_path: "backdrop.jpg",genre_ids: [28])
        moviesVM?.movies = [movie]
        
        let genre = Genre(id: 28, name: "Action")
        let genres = Genres(genres: [genre])
        moviesVM?.genres = genres.genres ?? []
    }

    override func tearDownWithError() throws {
        moviesVM = nil
    }
    
    func testGetCount() {
        let count = moviesVM?.getRawCount()
        XCTAssertEqual(count, 1)
    }
    
    func testGetMovies() {
        let movie = moviesVM?.getMovie(index: 0)
        XCTAssertEqual(movie?.id, 12345)
        XCTAssertEqual(movie?.popularity, 99.99)
        XCTAssertEqual(movie?.release_date, "2021/12/25")
        XCTAssertEqual(movie?.title, "Merry Christmas")
        XCTAssertEqual(movie?.overview, "Merry Christmas everyone!")
        XCTAssertEqual(movie?.original_language, "en")
        XCTAssertEqual(movie?.poster_path, "poster.jpg")
        XCTAssertEqual(movie?.backdrop_path, "backdrop.jpg")
    }
    
    func testgetGeneresData() {
        let movie = moviesVM?.getMovie(index: 0)
        let str = moviesVM?.getGeneresData(arrayIDs: movie?.genre_ids ?? [])
        XCTAssertEqual(str, "Action")
        
    }
  

}
