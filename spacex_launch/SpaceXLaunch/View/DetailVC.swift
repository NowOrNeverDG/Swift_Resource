//
//  DetailVC.swift
//  SpaceXLaunch
//
//  Created by Ge Ding on 8/12/22.
//

import UIKit

class DetailVC: UIViewController {

    
    @IBOutlet weak var missionNameLabel: UILabel!
    @IBOutlet weak var rocketNameLabel: UILabel!
    @IBOutlet weak var rocketTypeLabel: UILabel!
    @IBOutlet weak var launchSiteLabel: UILabel!
    @IBOutlet weak var siteNameLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var landscapeImgView: UIImageView!
    
    var flight: Flights?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func configureFlightData(missonName:String, rocketName: String, rocketType: String, launchSite: String, siteName: String, detail:String, landscapeImgViewUrlStr: String) {
        DispatchQueue.main.async { [self] in
            missionNameLabel.text = "Mission Name: \(missonName)"
            rocketNameLabel.text = "Rocket Name: \(rocketName)"
            rocketTypeLabel.text = "Rocket Type: \(rocketType)"
            launchSiteLabel.text = "Launch Site: \(launchSite)"
            siteNameLabel.text = "Site Name: \(siteName)"
            detailsLabel.text = "Detail: \(detail)" + "\nRamata's changes"
            landscapeImgView.imageFromURL(urlString: landscapeImgViewUrlStr)
        }
    }
    
    
    

}
