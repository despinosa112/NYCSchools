//
//  ScoresService.swift
//  NewYorkSchools
//
//  Created by Daniel Espinosa on 6/12/19.
//  Copyright © 2019 Daniel Espinosa. All rights reserved.
//

import UIKit

class ScoresService: NSObject {

    static func fetchScoreSet(dbn: String, completion: @escaping([ScoreSet]?) -> ()){
        let urlString = "https://data.cityofnewyork.us/resource/f9bf-2cp4.json?dbn=\(dbn)"
        guard let url = URL(string: urlString) else { return }
        NetworkService.fetch(url: url) { (scoreSet) in
            DispatchQueue.main.async {
                completion(scoreSet)
            }
        }
    }
}

