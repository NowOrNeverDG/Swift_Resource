//
//  MovieTableViewCell.swift
//  WalmartMovieDB
//
//  Created by Ge Ding on 12/16/21.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var movieImgView: UIImageView!
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieReleaseLabel: UILabel!
    @IBOutlet weak var movieScoreLabel: UILabel!
    @IBOutlet weak var movieGenreLabel: UILabel!
    var movie:Movie?
    var urlPath = URLPath.shared
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setDataForCell(genreValue:String) {
        movieTitleLabel.text = "Title: \(movie?.title ?? "N/A")"
        movieScoreLabel.text = "Popularity Score: \(String(movie?.popularity ?? 0.0))"
        movieReleaseLabel.text = "Release Date: \(movie?.release_date ?? "N/A")"
        movieGenreLabel.text = genreValue
        let urlStr = urlPath.image_url_path + (movie?.poster_path ?? "")
        ImageDownloader.shared.getImage(url: urlStr) { image in
            DispatchQueue.main.async { [weak self] in
                self?.movieImgView.image = image
            }
        }
    }
    
    


}
