//
//  ViewController.swift
//  NewYorkSchools
//
//  Created by Daniel Espinosa on 6/12/19.
//  Copyright © 2019 Daniel Espinosa. All rights reserved.
//

import UIKit

class SchoolsController: UIViewController {

    @IBOutlet weak var schoolsTableView: SchoolsTableView!
    
    var schools: [School] = [School]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "NYC Schools"
        reload()
    }

    
    func pushDetailsController(school: School){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let detailsController = storyboard.instantiateViewController(withIdentifier: "detailsController") as? DetailsController else { return }
        detailsController.set(school: school)
        self.navigationController?.pushViewController(detailsController, animated: true)
    }

}


extension SchoolsController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return schools.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = schoolsTableView.dequeueReusableCell(withIdentifier: "schoolsCellId") as! SchoolsCell
        cell.setupWith(school: schools[indexPath.item])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pushDetailsController(school: schools[indexPath.item])
        
    }
    
    func reload(){
        SchoolsService.fetchSchools { (schools) in
            guard let schools = schools else { return }
            self.schools = schools
            self.schoolsTableView.reloadData()
            
        }
    }
    
}

