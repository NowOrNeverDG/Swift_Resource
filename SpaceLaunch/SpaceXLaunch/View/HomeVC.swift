//
//  ViewController.swift
//  SpaceXLaunch
//
//  Created by Ge Ding on 8/11/22.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var homeTableView: UITableView!
    let vm = HomeViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.barTintColor = UIColor.black
        
        self.title = "SpaceX Launch"
        getFlightFromVM()
    }

    func getFlightFromVM() {
        guard let url = URL(string: Constant.GET_FLIGHT_INFO.rawValue)
        else { fatalError() }
        vm.getData(url: url) {
            DispatchQueue.main.async {
                self.homeTableView.reloadData()
            }
        }
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.getCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.homeTableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as? HomeTableViewCell
        cell?.configureData(missionName: vm.getMissionName(index: indexPath.row), rocketName: vm.getRocketName(index: indexPath.row), launchSiteName: vm.getLaunchSiteName(index: indexPath.row), launchDate: vm.getDateOfLaunch(index: indexPath.row), launchPatchimageUrlstr: vm.getPatchImageUrlString(index: indexPath.row), missionStatus: vm.getMissionStatus(index: indexPath.row))
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        guard let objDetailVC = sb.instantiateViewController(withIdentifier: "DetailVC") as? DetailVC else {return }
        objDetailVC.configureFlightData(missonName: vm.getMissionName(index: indexPath.row), rocketName: vm.getRocketName(index: indexPath.row), rocketType: vm.getRocketType(index: indexPath.row) , launchSite: vm.getLaunchSiteName(index: indexPath.row),siteName: vm.getSiteName(index: indexPath.row),detail: vm.getDetail(index: indexPath.row), landscapeImgViewUrlStr: vm.getLandscapeUrlString(index: indexPath.row))
        present(objDetailVC, animated: true)
    }
    
    
}

