//
//  ActivitiesViewController.swift
//  ItineraryApp
//
//  Created by Abdoulaye Diallo on 3/9/19.
//  Copyright © 2019 Abdoulaye Diallo. All rights reserved.
//

import UIKit

class ActivitiesViewController: UIViewController {
    
    let HeaderCellID = "HeaderCell"
    let cellID = "CellID"
    
    var tripId:  UUID!
    var tripModel: TripModel?
    var sectionHeaderHeight : CGFloat = 0.0
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var  backgroundImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        TripFunctions.readTrips(by: tripId) { [weak self] (model) in
            self?.tripModel = model
            guard let model = model  else { return }
            self?.title = model.title
            self?.backgroundImageView.image = model.image
            self?.tableView.reloadData()
        }
        //Store the section Header to use in the tableView
        sectionHeaderHeight = self.tableView.dequeueReusableCell(withIdentifier: HeaderCellID)?.contentView.bounds.height ?? 0.0
        
    }
    
    @IBAction func back(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}

//MARK: - Tableview datasource
extension  ActivitiesViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return tripModel?.dayModels.count ?? 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  tripModel?.dayModels[section].activityModels.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
         let model =  tripModel?.dayModels[indexPath.section].activityModels[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID)  as! AcitivityTableViewCell
        cell.setup(model: model!)
        return cell
    }
}

//MARK: TableView delegates
extension ActivitiesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let dayModel = tripModel?.dayModels[section]
        let cell = tableView.dequeueReusableCell(withIdentifier: HeaderCellID ) as! HeaderTableViewCell
        cell.setup(model: dayModel!)
        return cell.contentView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let cell = tableView.dequeueReusableCell(withIdentifier: HeaderCellID)
         return cell?.bounds.size.height ?? 44.0
    }
}
