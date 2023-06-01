//
//  ViewController.swift
//  WalmartMovieDB
//
//  Created by Ge Ding on 12/16/21.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var apiHandler = APIHandler.shared
    var urlPath = URLPath.shared
    var movieViewModel:MovieViewModel?
    var model:[Movie] = []
    

    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var movieTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        movieViewModel = MovieViewModel()

        
        guard let url = URL(string: urlPath.getUrlPath()) else { fatalError() }
        movieViewModel?.fetchData(url: url, completionHandler: {
            DispatchQueue.main.async {
                self.movieTableView.reloadData()
            }
        })
        movieViewModel?.fetchGenreData(url: url, completionHandler: {})
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieViewModel?.getRawCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = movieTableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for:indexPath) as! MovieTableViewCell
        let movie = movieViewModel?.getMovie(index: indexPath.row)
        cell.movie = movie
        let genreId = movie?.genre_ids ?? []
        let genreValue = movieViewModel?.getGeneresData(arrayIDs: genreId) ?? ""
        cell.setDataForCell(genreValue: genreValue)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let genreValue = movieViewModel?.getGeneresData(arrayIDs: movieViewModel?.getGenreIDsFor(index: indexPath.row) ?? []) ?? ""
        let sb = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = sb.instantiateViewController(identifier: "DetailViewController") as? DetailViewController,
              let movieViewModel = self.movieViewModel,
              let movie = movieViewModel.getMovie(index: indexPath.row) else {return}
        vc.setMovieData(movie:movie,genre: genreValue)
        present(vc, animated: true, completion: nil)
    }

}

