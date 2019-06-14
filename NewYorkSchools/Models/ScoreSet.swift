//
//  Scores.swift
//  NewYorkSchools
//
//  Created by Daniel Espinosa on 6/12/19.
//  Copyright © 2019 Daniel Espinosa. All rights reserved.
//

import Foundation

struct ScoreSet: Decodable {
    let dbn: String?
    let school_name: String?
    let num_of_sat_test_takers: String?
    let sat_critical_reading_avg_score: String?
    let sat_math_avg_score: String?
    let sat_writing_avg_score: String?
}

