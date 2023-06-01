//
//  DetailViewController.swift
//  WalmartMovieDB
//
//  Created by Ge Ding on 12/16/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var detailTitleLabel: UILabel!
    @IBOutlet weak var detailScoreLabel: UILabel!
    @IBOutlet weak var detailReleaseLabel: UILabel!
    @IBOutlet weak var detailGenreLabel: UILabel!
    @IBOutlet weak var detailOverviewLabel: UILabel!
    @IBOutlet weak var detailImgView: UIImageView!
    

    var titleStr:String?
    var scoreStr: String?
    var releaseStr: String?
    var genreStr:String?
    var overviewStr: String?
    var urlPath = URLPath.shared
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailTitleLabel.text = titleStr
        detailScoreLabel.text = scoreStr
        detailReleaseLabel.text = releaseStr
        detailGenreLabel.text = genreStr
        detailOverviewLabel.text = overviewStr
    }
    
    func setMovieData(movie:Movie, genre:String) {
        titleStr = movie.title ?? "N/A"
        scoreStr = "Score: \(movie.popularity ?? 0.0)"
        releaseStr = "Release Date: \(movie.release_date ?? "N/A")"
        overviewStr = movie.overview ?? ""
        genreStr = "Genre: \(genre)"
        
        let urlStr = urlPath.image_url_path + (movie.backdrop_path ?? "")
        ImageDownloader.shared.getImage(url: urlStr) { image in
            DispatchQueue.main.async {
                self.detailImgView.image = image
            }
        }
    }

}
