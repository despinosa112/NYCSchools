//
//  SchoolsService.swift
//  NewYorkSchools
//
//  Created by Daniel Espinosa on 6/12/19.
//  Copyright © 2019 Daniel Espinosa. All rights reserved.
//

import UIKit

class SchoolsService: NSObject {
    static func fetchSchools(completion: @escaping([School]?) -> ()){
        let urlString = "https://data.cityofnewyork.us/resource/s3k6-pzi2.json"
        guard let url = URL(string: urlString) else { return }
        NetworkService.fetch(url: url) { (schools) in
            DispatchQueue.main.async {
                completion(schools)
            }
        }
    }
}
