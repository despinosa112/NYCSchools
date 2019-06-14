//
//  XIBHelper.swift
//  NewYorkSchools
//
//  Created by Daniel Espinosa on 6/13/19.
//  Copyright © 2019 Daniel Espinosa. All rights reserved.
//

import UIKit

class XIBHelper: NSObject {

    static func loadXIB<T: UIView>(named: String, type: T) -> T? {
        if let view = Bundle.main.loadNibNamed(named, owner: self, options: nil)?.first as? T{
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        } else {
            return nil
        }
    }
    
}
