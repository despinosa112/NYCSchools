//
//  DetailsController.swift
//  NewYorkSchools
//
//  Created by Daniel Espinosa on 6/12/19.
//  Copyright © 2019 Daniel Espinosa. All rights reserved.
//

import UIKit

class DetailsController: UIViewController {
    
    let detailsView: DetailsView = XIBHelper.loadXIB(named: "DetailsView", type: DetailsView())!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Test Scores"
        layoutDetailsView()
    }
    

    func layoutDetailsView(){
        self.view.addSubview(detailsView)
        detailsView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        detailsView.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 0).isActive = true
        detailsView.rightAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.rightAnchor, constant: 0).isActive = true
        detailsView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
    }
    
    func set(school: School){
        self.detailsView.schoolNameLabel.text = school.school_name != nil ? school.school_name : ""
        guard let dbn = school.dbn else { return }
        ScoresService.fetchScoreSet(dbn: dbn) { (scoreSets) in
            guard let scoreSets = scoreSets else { return }
            if !(scoreSets.count > 0)  { return }
            let scoreSet = scoreSets[0]
            self.detailsView.mathLabel.text = scoreSet.sat_math_avg_score != nil ? "Avg Math Score: \(scoreSet.sat_math_avg_score!)" : "Avg Math Score: N/A"
            self.detailsView.readingLabel.text = scoreSet.sat_critical_reading_avg_score != nil ? "Avg Reading Score: \(scoreSet.sat_critical_reading_avg_score!)" : "Avg Reading Score: N/A"
            self.detailsView.writingLabel.text = scoreSet.sat_writing_avg_score != nil ? "Avg Writing Score: \(scoreSet.sat_writing_avg_score!)" : "Avg Writing Score: N/A"
            
        }
    }

}

