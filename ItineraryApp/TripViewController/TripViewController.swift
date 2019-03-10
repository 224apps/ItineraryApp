//
//  TripViewController.swift
//  ItineraryApp
//
//  Created by Abdoulaye Diallo on 3/6/19.
//  Copyright © 2019 Abdoulaye Diallo. All rights reserved.
//

import UIKit
import MaterialComponents

class TripViewController: UIViewController {
    
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var helpView: UIVisualEffectView!
    var tripIndexEdit: Int?
    let seenTripString = "seenHelpView"
    let segueIdentifier = "addTrip"
    let  cellDetailsSegue = "cellDetailsSegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        
        TripFunctions.readTrips { [unowned self] in
            self.tableView.reloadData()
            if Data.tripModels.count > 0 {
                if UserDefaults.standard.bool(forKey: self.seenTripString ) == false {
                    self.view.addSubview(self.helpView)
                    self.helpView.frame = self.view.frame
                }
            }
        }
        view.backgroundColor = Theme.background
        addButton.createFloatingButton()
        addButton.setTitle("+", for: UIControlState())
        addButton.backgroundColor = UIColor(red: 238.0/255.0, green: 130.0/255.0, blue: 34.0/255.0, alpha:1.0)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueIdentifier {
            let popupView = segue.destination as! AddTripViewController
            popupView.tripIndexEdit = self.tripIndexEdit
            popupView.doneSaving = { [weak self] in
                self?.tableView.reloadData()
            }
        }
    }
    
    
    
    @IBAction func closeHelpView(_ sender: Any) {
        
        UIView.animate(withDuration: 0.5, animations: {
            self.helpView.alpha = 0
        }) { (success) in
            self.helpView.removeFromSuperview()
            UserDefaults.standard.setValue(true, forKeyPath:self.seenTripString)
        }
    }
}

extension TripViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Data.tripModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellID", for: indexPath) as! TripTableViewCell
        cell.setup(tripModel: Data.tripModels[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let edit = UIContextualAction(style: .normal, title: "Edit Trip") { (action, view, actionPerformed:(Bool)->()) in
            self.tripIndexEdit =  indexPath.row
            self.performSegue(withIdentifier: self.segueIdentifier, sender: nil)
            actionPerformed(true)
        }
        edit.backgroundColor = .blue
        return UISwipeActionsConfiguration(actions: [edit])
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete Row") { (action, view, actionPerformed:@escaping (Bool)->()) in
            
            
            let alert = UIAlertController(title: "Delete trip.", message: "Are you sure, you want to delete this trip?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
                actionPerformed(true)
            }))
            alert.addAction(UIAlertAction(title: "delete", style: .destructive, handler: { (action) in
                TripFunctions.deleteTrip(indexPath: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .automatic)
                actionPerformed(true)
            }))
            self.present(alert, animated: true)
        }
        
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        return configuration
    }
    
    
}
