//
//  SchoolsCell.swift
//  NewYorkSchools
//
//  Created by Daniel Espinosa on 6/12/19.
//  Copyright © 2019 Daniel Espinosa. All rights reserved.
//

import UIKit

class SchoolsCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var detailsLabel: UILabel!
    
    
    func setupWith(school: School){
        nameLabel.text = school.school_name != nil ? school.school_name : ""
        detailsLabel.text = school.primary_address_line_1 != nil ? school.primary_address_line_1 : ""
    }


}
