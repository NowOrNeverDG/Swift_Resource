//
//  HomeTableViewCell.swift
//  SpaceXLaunch
//
//  Created by Ge Ding on 8/11/22.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var missionNameLabel: UILabel!
    @IBOutlet weak var rocketNameLabel: UILabel!
    @IBOutlet weak var launchSiteNameLabel: UILabel!
    @IBOutlet weak var launchdateLabel: UILabel!
    @IBOutlet weak var missionStatusLabel: UILabel!
    @IBOutlet weak var launchPatchImageView: UIImageView!
    var vm = HomeViewModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureData(missionName:String, rocketName:String, launchSiteName: String, launchDate: String, launchPatchimageUrlstr: String, missionStatus: String) {
        missionNameLabel.text = "Mission: \(missionName)"
        rocketNameLabel.text = "Rocket: \(rocketName)"
        launchSiteNameLabel.text = "Launch Site: \(launchSiteName)"
        launchdateLabel.text = "Date: \(launchDate)"
        missionStatusLabel.text = "Status: \(missionStatus)"
        launchPatchImageView.imageFromURL(urlString: launchPatchimageUrlstr)
        ImageDownloader.shared.getImage(url: launchPatchimageUrlstr) { image in
            
        }
    }


}
