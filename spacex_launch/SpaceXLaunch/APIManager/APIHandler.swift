//
//  APIHandler.swift
//  SpaceXLaunch
//
//  Created by Ge Ding on 8/11/22.
//

import Foundation

class APIHandler {
    private init() {}
    static let shared = APIHandler()
    
    func fetchData(url:URL, completionHandler:@escaping (([Flights])->Void)) {
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if error == nil && data != nil {
                do {
                    let model = try JSONDecoder.init().decode([Flights].self, from: data!)
                    completionHandler(model)
                } catch {
                    fatalError()
                }
            }
        }.resume()
    }
}
